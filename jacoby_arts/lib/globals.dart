import 'package:firebase_auth/firebase_auth.dart';

class JacUser {

  FirebaseUser fbuser;    //for firebase authentication

  String memberID;        //use userID that firebase creates
  String membershipID;
  String accountID;
  //int artworkDiscountCount;
  //int classDiscountCount;
  String email;
  //int freeTicketCount;
  //String imageUrl;
  DateTime membershipStartDate;
  DateTime membershipEndDate;
  String firstName;
  String lastName;
}

JacUser user = JacUser();