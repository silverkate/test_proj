import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/screens/home/carts/carts_bloc.dart';
import 'package:test_proj/screens/home/carts/pages/cart_modal_form_bloc.dart';
import 'package:test_proj/screens/home/carts/pages/widgets/products_modal_widget.dart';
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
          formBloc.isEditing ? 'Edit the cart' : 'Add a new cart',
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
                NumberInputFormBuilder(
                  label: 'User id',
                  hintText: 'User id',
                  fieldBloc: formBloc.userId,
                ),
                TextInputFormBuilder(
                  label: 'Date',
                  hintText: 'Date',
                  fieldBloc: formBloc.date,
                ),
                const Text('Products'),
                const ProductsModalWidget(),
                ElevatedButton(
                  onPressed: () => _addNewProduct(context),
                  child: const Text('Add a new product'),
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
    final cartsBloc = context.read<CartsBloc>();
    final cart = state.response as Cart;

    if (state.isEditing) {
      cartsBloc.editItem(cart);
    } else {
      cartsBloc.addItem(cart);
    }

    context.router.pop();
  }

  void _addNewProduct(BuildContext context) {
    context.read<CartModalBloc>().addProduct(const Product());
  }
}
