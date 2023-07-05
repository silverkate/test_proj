import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/screens/home/carts/pages/cart_modal_form_bloc.dart';
import 'package:test_proj/widgets/form_builder/index.dart';

class ProductInputFormBuilder extends StatelessWidget {
  const ProductInputFormBuilder({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<CartModalBloc>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: NumberInputFormBuilder(
            label: 'Product id',
            hintText: 'Product id',
            fieldBloc: formBloc.products.fields[index].fields.first,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: NumberInputFormBuilder(
            label: 'Quantity',
            hintText: 'Quantity',
            fieldBloc: formBloc.products.fields[index].fields[1],
          ),
        ),
      ],
    );
  }
}
