import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order_item.dart';
import './badge.dart';

class Order extends StatefulWidget {
  final OrderItem order;

  Order(this.order);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('₹${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MMM yyyy hh:mm').format(widget.order.orderedAt),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (context, i) => ListTile(
                  leading: Badge(
                    rightPosition: 0,
                    topPosition: 0,
                    value: widget.order.products[i].quantity.toString(),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.order.products[i].imageURL),
                    ),
                  ),
                  title: Text(widget.order.products[i].title),
                  trailing: Text(
                    '₹${(widget.order.products[i].price * widget.order.products[i].quantity)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
