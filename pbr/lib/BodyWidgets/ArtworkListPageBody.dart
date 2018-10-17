import 'package:flutter/material.dart';

class ArtworkListPageBody extends StatelessWidget {
  ArtworkListPageBody();

  void _updateArtworkList() {
    // TODO: update the list of artwork using a DAO.
  }

  void _switchViewToArtworkDetails(/*Artwork artwork*/) {
    // TODO: create new ArtworkDetailsPage w. artwork..
    // TODO: build and push the ArtworkDetailsPage onto the nav stack..
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //This is where the code for the body of your page will go
      child:
      new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            new Text(
              "Put the List of Artwork Here..",
              style: new TextStyle(fontSize:30.0,
                  color: const Color(0xFF080808),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto"),
            ),
          ]
      ),
    );
  }
}
