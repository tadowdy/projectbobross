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

  JacUser.fromMap(Map<String, dynamic> map)
    : accountID = map['account_id'],
      email = map['email'],
      firstName=map['first_name'],
      lastName=map['last_name'],
      membershipEndDate=map['membership_end_date'],
      memberID=map['membership_id'],
      membershipStartDate=map['membership_start_date'];
  JacUser.fromSnapshot(DocumentSnapshot snapshot)
    :this.fromMap(snapshot.data);

  void createUser(firstName, lastName, email, memberID) {

   Firestore.instance.collection('Members').document()
  .setData({ 'id': memberID, 'account_id': null, 'cart_id': null, 'email': email,
   'enrollment_type': null, 'first_name': firstName, 'is_company': false, 'last_name': lastName,
    'membership_end_date': null, 'membership_id': null, 'membership_start_date': null, 'organization_name': null,
     'tender_type': null, 'transaction_date': null });
  }

  Future<void> getUser(memberId) async {
     DocumentSnapshot ds = await Firestore.instance.collection('Members').document(memberId).get();
     user = JacUser.fromSnapshot(ds);
  }

  void signOut() {
    user = null;
  }

  JacUser();

}

JacUser user = JacUser();

