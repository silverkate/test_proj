import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/screens/home/carts/pages/cart_modal_form_bloc.dart';
import 'package:test_proj/services/index.dart';
import 'package:test_proj/widgets/form_builder/index.dart';

@RoutePage()
class CartModalScreen extends StatelessWidget implements AutoRouteWrapper {
  const CartModalScreen({
    this.cart,
    super.key,
  });

  final Cart? cart;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartModalBloc>(param1: cart),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<CartModalBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formBloc.isEditing ? 'Edit the product' : 'Add a new product',
        ),
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
                  fieldBloc: formBloc.description,
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
