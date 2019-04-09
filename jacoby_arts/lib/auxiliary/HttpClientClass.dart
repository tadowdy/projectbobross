import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jacoby_arts/auxiliary/file';

getImage(imageName)async{
print('here');
 final StorageReference ref1 = FirebaseStorage.instance.ref();
 final StorageReference ref = FirebaseStorage.instance.ref().child(imageName);
 var path = await ref1.getPath();
print('here1');
 var image = await ref.getDownloadURL();
 print(path);
 print(image);


}