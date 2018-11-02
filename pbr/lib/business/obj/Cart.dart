//Author       : Logan Waldron
//Date Created : 11/1/18
//Date Modified: 11/1/18
//About        : A class for the cart object

import 'package:flutter/material.dart';

class Cart {
  int _cartId;


/*CONSTRUCTORS**********************************/
  Cart() {
    _cartId = 0;
  }

/*SETTERS***************************************/
void setCartId(int cartId) {
  _cartId = (cartId >= 0) ? cartId : 0;
}

/*GETTERS***************************************/
int getCartId() {
  return _cartId;
}

/*UTILITY****************************************/

}