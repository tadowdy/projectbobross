import 'package:flutter/material.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';
class ArtInfo {
  String artworkName;
  String artistName;
  int price;
  String imageUrl;

  ArtInfo(String artworkName, String artistName, int price, String imageUrl) {
    this.artworkName = artworkName;
    this.artistName = artistName;
    this.price = price;
    this.imageUrl = imageUrl;
  }
}

List _cartItems = <Artwork>[];

void addCartItem(Artwork artworkItem){
  _cartItems.add(artworkItem);
  print(_cartItems);
}

void removeCartItem(Artwork artworkItem){
  _cartItems.remove(artworkItem);
  print(_cartItems);
}

List getCartItems(){
  return _cartItems;
}