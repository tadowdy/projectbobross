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

void addCartItem(CartItemInfo item) {
  bool hasItem = false;

  print(_cartItems.length.toString());

  for (var inCart in _cartItems) {
    if (inCart.artistName == item.artistName &&
        inCart.artworkName == item.artworkName &&
        inCart.price == item.price) {
      hasItem = true;
    } else {}
  }

  if (hasItem == false) {
    _cartItems.add(item);
  }
}

void removeCartItem(CartItemInfo item) {
  _cartItems.remove(item);
}

List getCartItems() {
  return _cartItems;
}
