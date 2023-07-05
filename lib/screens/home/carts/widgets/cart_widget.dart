import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/screens/home/carts/carts_bloc.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    required this.cart,
    super.key,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _edit(context),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => _delete(context),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      title: Text(
        'Id: ${cart.id}, '
        'UserId: ${cart.userId}, '
        '${DateFormat.yMEd().format(cart.date ?? DateTime.now())}',
      ),
      subtitle: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cart.products?.length ?? 0,
        itemBuilder: _buildProducts,
      ),
    );
  }

  Widget? _buildProducts(BuildContext context, int index) {
    final product = cart.products?[index] ?? const CartProduct();

    return Text(
      'Product id: ${product.productId}, quantity: ${product.quantity}.',
    );
  }

  void _edit(BuildContext context) {
    context.router.push(CartModalRoute(cart: cart));
  }

  void _delete(BuildContext context) {
    context.read<CartsBloc>().removeItem(cart);
  }
}
