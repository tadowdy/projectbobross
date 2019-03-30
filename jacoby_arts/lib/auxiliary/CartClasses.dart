import 'package:flutter/material.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';


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