import 'package:flutter/foundation.dart';

class CartProduct {
  final String id;
  final String title;
  final String imageURL;
  final int quantity;
  final double price;

  CartProduct({
    @required this.id,
    @required this.title,
    @required this.imageURL,
    @required this.quantity,
    @required this.price,
  });
}
