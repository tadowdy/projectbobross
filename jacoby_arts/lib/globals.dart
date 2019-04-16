import 'package:cloud_firestore/cloud_firestore.dart';
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

  void createUser(firstName, lastName, email, memberID) {

   Firestore.instance.collection('members').document()
  .setData({ 'id': memberID, 'account_id': null, 'cart_id': null, 'email': email,
   'enrollment_type': null, 'first_name': firstName, 'is_company': false, 'last_name': lastName,
    'membership_end_date': null, 'membership_id': null, 'membership_start_date': null, 'organization_name': null,
     'tender_type': null, 'transaction_date': null });
  }

  void getUser(memberID) {

  }

  void signOut() {

  }

}

JacUser user = JacUser();

