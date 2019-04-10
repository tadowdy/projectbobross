const functions = require('firebase-functions');

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

// The Cloud Functions for Firebase SDK to create Cloud Functions and setup triggers.
const functions = require('firebase-functions');
const crypto = require("crypto");
const axios = require("axios"); // be sure to add to package.json via npm install axios

exports.authorize = functions.https.onRequest((request, response) => {
  const squareAuthURL = "https://connect.squareup.com/oauth2/authorize?";
  const state = crypto.randomBytes(32).toString("hex");
  response.set("Set-Cookie", `__session=${state}; Secure`);

  response.redirect(
    squareAuthURL +
      `client_id=${functions.config().square.app_id}&` +
      `response_type=code&` +
      `scope=MERCHANT_PROFILE_READ ITEMS_READ ORDERS_READ PAYMENTS_READ&` +
      `session=false&` +
      `locale=en-US&` +
      `state=${state}`
  );
});

const getSessionCookie = cookie => {
  let name = "__session=";
  let decodedCookie = decodeURIComponent(cookie);
  let ca = decodedCookie.split(";");
  for (let c of ca) {
    while (c.charAt(0) === " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) === 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
};

// TODO: Implement me as needed for use case!
const createOrUpdateFirebaseAccount = (userData, tokenData) => ({
  userData,
  tokenData
});

exports.callback = functions.https.onRequest((request, response) => {
  const tokenURL = "https://connect.squareup.com/oauth2/token";
  const redirectURI =
    "https://us-central1-jacobyartscenter.cloudfunctions.net/callback";
  const cookieState = getSessionCookie(request.get("cookie"));

  const { code, state } = request.query;

  if (cookieState === state) {
    const { app_id, secret } = functions.config().square;
    let access_token, id, email, name;
    return axios
      .post(tokenURL, {
        client_id: app_id,
        client_secret: secret,
        code: decodeURIComponent(code),
        redirect_uri: redirectURI
      })
      .then(token => {
        ({ access_token } = token.data);
        return (
          axios
            .get("https://connect.squareup.com/v1/me", {
              headers: {
                Authorization: `Bearer ${access_token}`
              }
            })
            .then(user => {
              //  return createOrUpdateFirebaseAccount(user.data, token.data);
              return response.json({
                tokenData: token.data,
                userData: user.data
              });
            })
            // .then(firebaseToken => {
            //   return response.json({
            //     email: email,
            //     token: firebaseToken
            //   });
            // })
            .catch(error => {
              console.log(error);
              return response.send(error);
            })
        );
      });
  } else {
    console.log(`INVALID STATE: ${cookieState} === ${state}`);
    return response.send(`INVALID STATE: ${cookieState} === ${state}`);
  }
});