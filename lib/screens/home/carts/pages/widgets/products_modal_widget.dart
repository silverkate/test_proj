import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/screens/home/carts/pages/cart_modal_form_bloc.dart';
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
    final formBloc = context.read<CartModalBloc>();
    final product = products?[index] ?? const Product();

    return ProductInputFormBuilder(
      fieldBloc: formBloc.products,
      index: index,
    );
  }
}
