import 'package:flutter/foundation.dart';

import '../models/cart_product.dart';

class Cart with ChangeNotifier {
  Map<String, CartProduct> _items = {};

  Map<String, CartProduct> get items => {..._items};

  int get itemCount => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String imageURL) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (oldCartItem) => CartProduct(
              id: oldCartItem.id,
              title: oldCartItem.title,
              imageURL: oldCartItem.imageURL,
              price: oldCartItem.price,
              quantity: oldCartItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartProduct(
                id: DateTime.now().toString(),
                title: title,
                imageURL: imageURL,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (oldValue) => CartProduct(
          id: oldValue.id,
          title: oldValue.title,
          imageURL: oldValue.imageURL,
          price: oldValue.price,
          quantity: oldValue.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
