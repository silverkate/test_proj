import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/screens/home/carts/pages/cart_modal_form_bloc.dart';
import 'package:test_proj/screens/home/carts/pages/widgets/product_input_form_builder.dart';

class ProductsModalWidget extends StatelessWidget {
  const ProductsModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<CartModalBloc>();

    return BlocBuilder(
      bloc: formBloc.products,
      builder: (_, __) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: formBloc.products.fields.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget? _itemBuilder(BuildContext context, int index) {
    return ProductInputFormBuilder(
      index: index,
    );
  }
}
