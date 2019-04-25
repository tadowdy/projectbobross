import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jacoby_arts/widgets/HomePageBody.dart';
import 'package:jacoby_arts/widgets/ArtworkListPageBody.dart';
import 'package:jacoby_arts/widgets/EventListPageBody.dart';
import 'package:jacoby_arts/widgets/CartPageBody.dart';
import 'package:jacoby_arts/widgets/AccountPageBody.dart';
import 'package:jacoby_arts/Auxiliary/uiComponents.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.user}) : super(key: key);

  final FirebaseUser user;

  //   Future<void> _onStartCardEntryFlow() async {
  //   await InAppPayments.startCardEntryFlow(
  //       onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
  //       onCardEntryCancel: _onCancelCardEntryFlow);
  // }
  //   void _onCancelCardEntryFlow() {
  //   // Handle the cancel callback
  // }
  //   void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
  //   try {
  //     // take payment with the card nonce details
  //     // you can take a charge
  //     // await chargeCard(result);

  //     // payment finished successfully
  //     // you must call this method to close card entry
  //     void _onCardEntryComplete() {
  //   // Update UI to notify user that the payment flow is finished successfully
  // }
  //     InAppPayments.completeCardEntry(
  //         onCardEntryComplete: _onCardEntryComplete);
  //   } on Exception catch (ex) {
  //     // payment failed to complete due to error
  //     // notify card entry to show processing error
  //     InAppPayments.showCardNonceProcessingError(ex.message);
  //   }
  // }

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Future<void> _initSquarePayment() async {
    await InAppPayments.setSquareApplicationId('sq0idp-ZiZd4OWH_IAerGyP9TUhWQ');
  }

  @override
  void initState() {
    super.initState();
    _initSquarePayment();
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageBody(),
    ArtworkListPageBody(),
    EventListPageBody(),
//// THE FOLLOWING PAGE IS NOT COMPLETE, HIDE IT BUT DO NOT REMOVE IT
//    CartPageBody(),
//// THE FOLLOWING PAGE IS NOT COMPLETE, HIDE IT BUT DO NOT REMOVE IT
//    AccountPageBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar,
      body: _children[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: themeColor,
            primaryColor: iconSelectedColor,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: iconColor))),
        child: new BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.image),
              title: new Text('Artwork'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.today),
              title: new Text('Events'),
            )
//// THE FOLLOWING PAGE IS NOT COMPLETE, HIDE IT BUT DO NOT REMOVE IT
//            BottomNavigationBarItem(
//              icon: new Icon(Icons.shopping_cart),
//              title: new Text('Cart'),
//            ),
//// THE FOLLOWING PAGE IS NOT COMPLETE, HIDE IT BUT DO NOT REMOVE IT
//            BottomNavigationBarItem(
//              icon: new Icon(Icons.account_circle),
//              title: new Text('Account'),
//            )
          ],
          type: BottomNavigationBarType.fixed,
          iconSize: 30.0,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
