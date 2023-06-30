// fieldBlocListener

import 'package:flutter/material.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';

@RoutePage()
class EditProductScreen extends StatelessWidget {
  const EditProductScreen({
    this.product,
    super.key,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(product?.title ?? 'no product'),
      ),
    );
  }
}
