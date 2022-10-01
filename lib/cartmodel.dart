import 'package:flutter/material.dart';

class CartModel {
  late final String name;
  late final String image;
  late final double price;
  late final int quantity;

  CartModel(
      {required this.name,
      required this.quantity,
      required this.price,
      required this.image});
}
