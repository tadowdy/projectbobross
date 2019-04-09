import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// getImage(imageName)async{
// print('here');
// final FirebaseStorage storage = FirebaseStorage(
//   app: Firestore.instance.app,
//   storageBucket: 'gs://jacobyartscenter-7657c.appspot.com'
// );
// var image = await storage.ref().child(imageName);
// //var ref = FirebaseStorage.instance.ref().child(imageName);
// print('here1');
// //var location = await ref.getDownloadURL() as String;



// return await image;
  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }
    // Get an Image
    HttpClient http = new HttpClient();
    try {
      var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      var decoded = json.decode(responseBody);
      var url = decoded['message'];
      imageUrl = url;
    } catch (exception) {
      print(exception);
    }
  }