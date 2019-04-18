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


    for(var incart in _cartItems){

      if(incart.artistName == item.artistName && 
          incart.artworkName == item.artworkName &&
          incart.price == item.price){

            hasItem = true;
          }else{

          }
    }
  
  if(hasItem == false){
    _cartItems.add(item);
  }

}

void removeCartItem(CartItemInfo item){
  _cartItems.remove(item);

}

List getCartItems(){
  return _cartItems;
}