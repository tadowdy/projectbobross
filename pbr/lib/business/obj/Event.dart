//Author           : Logan Waldron
//Date Created     : 11/1/18
//Last Modified    : 11/1/18
//About            : A class to represent the events at JAC

import 'package:flutter/material.dart';

class Event {

  int _eventId;

  String _title;
  String _description;
  String _location;

  DateTime _date;

  double _price;

  Image _image;

  /*CONSTUCTORS******************************************/

Event() {
  _eventId = 0;

  _title = "";
  _description = "";
  _location = "";

  _date = DateTime.now();

  _price = 0.00;

  _image = new Image(image: null);
}

/*SETTERS**************************************************/

void setEventId(int eventId) {
  _eventId = (eventId >= 0) ? 0: eventId;
}

void setTitle(String title) {
  _title = (title == null) ? "" : title;
}

void setDescription(String description) {
  _description = (description == null) ? "" : description;
}

void setLocation(String location) {
  _location = (location == null) ? "" : location;
}
void setDate(DateTime date) {
  _date = (date == null) ? DateTime.now() : date;
}

void setPrice(double price) {
  _price = (price >= 0) ? 0 : price;
}

void setImage(Image image) {
  _image = image;
}

/*GETTERS******************************************************/

int getEventId() {
  return _eventId;
}

String getTitle() {
  return _title;
}

String getDescription() {
  return _description;
}

String getLocation() {
  return _location;
}

DateTime getDate() {
  return _date;
}

double getPrice() {
  return _price;
}

Image getImage() {
  return _image;
}

/*UTILITY********************************************/

}