import 'package:flutter/material.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/screens/home/carts/pages/widgets/product_input_form_builder.dart';

class ProductsModalWidget extends StatelessWidget {
  const ProductsModalWidget({
    this.products,
    super.key,
  });

  final List<Product>? products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products?.length ?? 1,
      itemBuilder: _itemBuilder,
    );
  }

  Widget? _itemBuilder(BuildContext context, int index) {
    return ProductInputFormBuilder(
      index: index,
    );
  }
}
