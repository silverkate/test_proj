import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/screens/home/products/pages/product_modal_form_bloc.dart';
import 'package:test_proj/screens/home/products/stx_products_bloc.dart';
import 'package:test_proj/services/index.dart';
import 'package:test_proj/widgets/form_builder/index.dart';

@RoutePage()
class ProductModalScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProductModalScreen({
    this.product,
    super.key,
  });

  final Product? product;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductModalFormBloc>(param1: product),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<ProductModalFormBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formBloc.isEditing ? 'Edit the product' : 'Add a new product',
        ),
      ),
      body: CustomFormBlocListener(
        formBloc: formBloc,
        onSuccess: (_, state) {
          final product = state.response as Product?;
          final productBloc = context.read<StxProductsBloc>();

          if (state.isEditing) {
            productBloc.editItem(product ?? const Product());
          } else {
            productBloc.addItem(product ?? const Product());
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextInputFormBuilder(
                  label: 'Title',
                  hintText: 'Title',
                  fieldBloc: formBloc.title,
                ),
                TextInputFormBuilder(
                  label: 'Description',
                  hintText: 'Description',
                  maxLines: 4,
                  fieldBloc: formBloc.description,
                ),
                DropDownFormBuilder(
                  label: 'Category',
                  fieldBloc: formBloc.category,
                ),
                TextInputFormBuilder(
                  label: 'Price',
                  hintText: 'Price',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]')),
                  ],
                  fieldBloc: formBloc.price,
                ),
                ElevatedButton(
                  onPressed: formBloc.submit,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitSuccess(BuildContext context, _) {
    context.router.pop();
  }
}
