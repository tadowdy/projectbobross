//Author      : Logan Waldron
//Date Created: 11/1/18
//Last Modified: 11/1/18
//About         : A class used to represent the JAC newsletter

import 'package:flutter/material.dart';

class Newsletter {
  int _newsletterId;

  String _title;
  String _description;
  String _location;

  DateTime _date;

  double _price;

  Image _image;

  /*CONSTRUCTORS******************************************/

  Newsletter() {
    _newsletterId = 0;

    _title = "";
    _description = "";
    _location = "";

    _date = DateTime.now();

    _price = 0.00;

    _image = new Image(image: null);
  }

/*SETTERS**************************************************/

  void setEventId(int newsletterId) {
    _newsletterId = (newsletterId >= 0) ? 0: newsletterId;
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
    return _newsletterId;
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