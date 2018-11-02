// Author       : Thomas M Clifford
// Date Created : 10/31/2018
// Last Modified: 10/31/2018
// About        : A class used to represent a membership package for JAC

import 'package:flutter/material.dart';

class Membership {

  int _membershipId;

  double _artworkDiscount;
  int _artworkDiscountCount;

  double _classDiscount;
  int _classDiscountCount;

  int _freeTicketCount;

  Image _boarderImage;

  /*CONSTRUCTORS***************************************************************/
  Membership() {
    _membershipId = 0;

    _artworkDiscount = 0;
    _artworkDiscountCount = 0;

    _classDiscount = 0;
    _classDiscountCount = 0;

    _freeTicketCount = 0;

    _boarderImage = new Image(image: null);
  }

  /*SETTERS********************************************************************/
  void setMembershipId(int membershipId) {
    _membershipId = (membershipId >= 0) ? membershipId : 0;
  }

  void setArtworkDiscount(double artworkDiscount) {
    artworkDiscount = (artworkDiscount >= 0) ? artworkDiscount : 0;
    _artworkDiscount = (artworkDiscount <= 1) ? artworkDiscount : 1;
  }

  void setArtworkDiscountCount(int artworkDiscountCount) {
    _artworkDiscountCount = (artworkDiscountCount >= 0) ? artworkDiscountCount : 0;
  }

  void setClassDiscount(double classDiscount) {
    classDiscount = (classDiscount >= 0) ? classDiscount : 0;
    _classDiscount = (classDiscount <= 1) ? classDiscount : 1;
  }

  void setClassDiscountCount(int classDiscountCount) {
    _classDiscountCount = (classDiscountCount >= 0) ? classDiscountCount : 0;
  }

  void setFreeTicketCount(int freeTicketCount) {
    _freeTicketCount = (freeTicketCount >= 0) ? freeTicketCount : 0;
  }

  void setBoarderImage(Image boarderImage) {
    _boarderImage = boarderImage;
  }

  /*GETTERS********************************************************************/
  int getMembershipId() {
    return _membershipId;
  }

  double getArtworkDiscount() {
    return _artworkDiscount;
  }

  int getArtworkDiscountCount() {
    return _artworkDiscountCount;
  }

  double getClassDiscount() {
    return _classDiscount;
  }

  int getClassDiscountCount() {
    return _classDiscountCount;
  }

  int getFreeTicketCount() {
    return _freeTicketCount;
  }

  Image getBoarderImage() {
    return _boarderImage;
  }

  /*UTILITY********************************************************************/

}
