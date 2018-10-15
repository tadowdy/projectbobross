import 'package:flutter/material.dart';

class ArtworkDetailsPage extends StatelessWidget {

  void _addArtworkToCart(/*Artwork artwork, Cart cart*/) {
    // TODO: add the artwork to the cart.
    // TODO: notify the user whether the artwork was added to the cart using a popup.
  }

  void _submitArtworkFeedback(/*Text feedback*/) {
    // TODO: submit the feedback using a DAO.
    // TODO: notify the user whether the feedback was submitted using a popup.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text('Artwork Details')
      ),
      body: Center(
        child: Text('Put the Artwork Details Here..'),
      ),
    );
  }
}
