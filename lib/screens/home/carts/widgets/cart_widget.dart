import 'package:flutter/material.dart';
import 'package:test_proj/models/index.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    required this.cart,
    super.key,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return const Text('CartWidget');
  }
}
