// fieldBlocListener

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/services/index.dart';
import 'package:test_proj/widgets/form_builder/index.dart';

@RoutePage()
class EditProductScreen extends StatelessWidget implements AutoRouteWrapper {
  const EditProductScreen({
    this.product,
    super.key,
  });

  final Product? product;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProductFormBloc>(param1: product),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<EditProductFormBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(product == null ? 'Add a new product' : 'Edit the product'),
      ),
      body: CustomFormBlocListener(
        formBloc: formBloc,
        onSuccess: _submitSuccess,
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
                TextInputFormBuilder(
                  label: 'Category',
                  hintText: 'Category',
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

  void _submitSuccess(
    BuildContext context,
    FormBlocState<dynamic, String> state,
  ) {
    final productsBloc = context.read<StxProductsBloc>();
    final formBloc = context.read<EditProductFormBloc>();

    if (state.isEditing) {
      final editedProduct = product?.copyWith(
            title: formBloc.title.value ?? '',
            description: formBloc.description.value ?? '',
            category: formBloc.category.value ?? '',
            price: formBloc.price.valueToDouble ?? 0.0,
          ) ??
          const Product();

      productsBloc.editItem(editedProduct);
    } else {
      final product = Product(
        title: formBloc.title.value ?? '',
        description: formBloc.description.value ?? '',
        category: formBloc.category.value ?? '',
        price: formBloc.price.valueToDouble ?? 0.0,
      );

      productsBloc.addItem(product);
    }

    context.router.pop();
  }
}
