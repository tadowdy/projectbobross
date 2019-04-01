import 'package:flutter/material.dart';
import 'package:jacoby_arts/auxiliary/ArtworkClass.dart';

class CartItemInfo {
  String artworkName;
  String artistName;
  int price;
  String url;

  CartItemInfo(String artworkName, String artistName, int price, String url) {
    this.artworkName = artworkName;
    this.artistName = artistName;
    this.price = price;
    this.url = url;
  }
}

List _cartItems = <CartItemInfo>[];

void addCartItem(CartItemInfo item){
  bool hasItem = false;
  print('in add to cart');
  print(_cartItems.length.toString());

    for(var incart in _cartItems){
      print('top of for');
      if(incart.artistName == item.artistName && 
          incart.artworkName == item.artworkName &&
          incart.price == item.price){
            print('here');
            hasItem = true;
          }else{

          }
    }
  
  if(hasItem == false){
    _cartItems.add(item);
  }
  print(_cartItems);
}

void removeCartItem(CartItemInfo item){
  _cartItems.remove(item);
  print(_cartItems);
}

List getCartItems(){
  return _cartItems;
}