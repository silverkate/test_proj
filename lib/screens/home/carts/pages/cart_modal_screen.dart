import 'package:flutter/material.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';

@RoutePage()
class CartModalScreen extends StatelessWidget {
  const CartModalScreen({
    this.cart,
    super.key,
  });

  final Cart? cart;

  @override
  Widget build(BuildContext context) {
    return const Text('CartModalScreen');
  }
}
