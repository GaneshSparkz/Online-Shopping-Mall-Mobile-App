import 'package:flutter/foundation.dart';

import './cart_product.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartProduct> products;
  final DateTime orderedAt;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.orderedAt,
  });
}
