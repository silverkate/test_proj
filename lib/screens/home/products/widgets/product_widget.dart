import 'package:flutter/material.dart';
import 'package:test_proj/models/index.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title ?? ''),
      subtitle: Text(product.description ?? ''),
    );
  }
}
