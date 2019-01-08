// Author       : Logan Waldron
// Date Created : 11/01/18
// Last Modified: 11/01/18
// About        : A class used to represent an exhibit at JAC

import 'package:flutter/material.dart';

class Exhibit {

  int _exhibitId;

  String _name;

  Image _image;

  /*CONSTRUCTORS***************************************************************/
  Exhibit() {
    _exhibitId = 0;

    _name = "";

    _image = new Image(image: null);
  }

  /*SETTERS********************************************************************/
  void setExhibitId(int exhibitId) {
    _exhibitId = (exhibitId >= 0) ? exhibitId : 0;
  }

  void setName(String name) {
    _name = (name == null) ? "" : name;
  }

  void setImage(Image image) {
    _image = image;
  }

  /*GETTERS********************************************************************/
  int getExhibitId() {
    return _exhibitId;
  }

  String getName() {
    return _name;
  }

  Image getImage() {
    return _image;
  }

  /*UTILITY********************************************************************/

}
