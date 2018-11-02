// Author       : Thomas M Clifford
// Date Created : 10/31/2018
// Last Modified: 10/31/2018
// About        : A class used to represent a piece of artwork for JAC

import 'package:flutter/material.dart';

enum MarketStatus { notForSale, forSale, sold }

class Artwork {

  int _artworkId;

  String _description;

  double _price;

  Image _image;

  MarketStatus _marketStatus;

  /*CONSTRUCTORS***************************************************************/
  Artwork() {
    _artworkId = 0;

    _description = "";

    _price = 0.0;

    _image = new Image(image: null);

    _marketStatus = MarketStatus.notForSale;
  }

  /*SETTERS********************************************************************/
  void setArtworkId(int artworkId) {
    _artworkId = (artworkId >= 0) ? artworkId : 0;
  }

  void setDescription(String description) {
    _description = (description == null) ? "" : description;
  }

  void setPrice(double price) {
    _price = (price >= 0) ? price : 0;
  }

  void setImage(Image image) {
    _image = image;
  }

  void setMarketStatus(MarketStatus marketStatus) {
    _marketStatus = (marketStatus == null) ? MarketStatus.notForSale : marketStatus;
  }

  /*GETTERS********************************************************************/
  int getArtworkId() {
    return _artworkId;
  }

  String getDescription() {
    return _description;
  }

  double getPrice() {
    return _price;
  }

  Image getImage() {
    return _image;
  }

  MarketStatus getMarketStatus() {
    return _marketStatus;
  }

  /*UTILITY********************************************************************/

}
