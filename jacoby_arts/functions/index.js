// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
import * as functions from 'firebase-functions';

const functions = require('firebase-functions');
const admin = require('firebase-admin');
const crypto = require("crypto");
const axios = require("axios"); // be sure to add to package.json via npm install axios
const {
    TransactionsApi,
    OrdersApi,
    LocationsApi
} = require('square-connect');const express = require('express');
const defaultClient = SquareConnect.ApiClient.instance;
const bodyParser = require('body-parser');

admin.initializeApp(functions.config().firebase);

let oauth2 = defaultClient.authentications['oauth2']; // setting to use oauth version 2
oauth2.accessToken = process.env.ACCESS_TOKEN;  // getting access token from 


const transactionsApi = new TransactionsApi();
const ordersApi = new OrdersApi();
const locationsApi = new LocationsApi();

exports.chargeForCookie = functions.https.onRequest((req, res) =>{
    const requestBody = request.body;
    const locations = await locationsApi.listLocations();
    const locationId = locations.locations[0].id;
    const order = await ordersApi.createOrder(locationId, {
        dempotency_key: crypto.randomBytes(12).toString('hex'),
        merchant_id: locations.locations[0].merchant_id,
        line_items: [{
            name: "cookie",
            quantity: 1, 
            base_price_money: {amount: 100, currency: "USD"}
        }]
    })
});

try {
    const chargeBody = {
      "idempotency_key": crypto.randomBytes(12).toString('hex'),
      "card_nonce": requestBody.nonce,
      "amount_money": {
        ...order.order.total_money,
      },
      "order_id": order.order.id
    };
const transaction = await transactionsApi.charge(locationId, chargeBody);
    console.log(transaction.transaction);

exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});

exports.insertIntoDB = functions.https.onRequest((req, res) => {
    const text = req.query.text;
    admin.database().ref('/Carts').push({text: text}).then(snapshot => {
        res.redirect(303, snapshot.ref);
    })
});
