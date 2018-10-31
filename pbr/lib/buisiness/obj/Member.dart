// Author       : Thomas M Clifford
// Date Created : 10/31/2018
// Last Modified: 10/31/2018
// About        : A class used to represent a member of JAC

import 'package:flutter/material.dart';

class Member {

  int _memberId;

  int _artworkDiscountCount;
  int _classDiscountCount;
  int _freeTicketCount;

  DateTime _memberSince;
  DateTime _membershipSince;

  Icon _profileIcon;

  /*CONSTRUCTORS***************************************************************/
  Member() {
    _memberId = 0;

    _artworkDiscountCount = 0;
    _classDiscountCount = 0;
    _freeTicketCount = 0;

    _memberSince = DateTime.now();
    _membershipSince = DateTime.now();

    _profileIcon = new Icon(Icons.account_circle);
  }

  /*SETTERS********************************************************************/
  void setMemberId(int memberId) {
    _memberId = (memberId >= 0) ? memberId : 0;
  }

  void setArtworkDiscountCount(int artworkDiscountCount) {
    _artworkDiscountCount = (artworkDiscountCount >= 0) ? artworkDiscountCount : 0;
  }

  void setClassDiscountCount(int classDiscountCount) {
    _classDiscountCount = (classDiscountCount >= 0) ? classDiscountCount : 0;
  }

  void setFreeTicketCount(int freeTicketCount) {
    _freeTicketCount = (freeTicketCount >= 0) ? freeTicketCount : 0;
  }

  void setMemberSince(DateTime memberSince) {
    _memberSince = memberSince;
  }

  void setMembershipSince(DateTime membershipSince) {
    _membershipSince = membershipSince;
  }

  void setProfileIcon(Icon profileIcon) {
    _profileIcon = (profileIcon == null) ? Icons.account_circle : profileIcon;
  }

  /*GETTERS********************************************************************/
  int getMemberId() {
    return _memberId;
  }

  int getArtworkDiscountCount() {
    return _artworkDiscountCount;
  }

  int getClassDiscountCount() {
    return _classDiscountCount;
  }

  int getFreeTicketCount() {
    return _freeTicketCount;
  }

  DateTime getMemberSince() {
    return _memberSince;
  }

  DateTime getMembershipSince() {
    return _membershipSince;
  }

  Icon getProfileIcon() {
    return _profileIcon;
  }

  /*UTILITY********************************************************************/

}