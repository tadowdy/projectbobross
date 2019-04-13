// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);

exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});

exports.insertIntoDB = functions.https.onRequest((req, res) => {
    const text = req.query.text;
    admin.database().ref('/Carts').push({text: text}).then(snapshot => {
        res.redirect(303, snapshot.ref);
    })
});