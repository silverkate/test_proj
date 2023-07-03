import 'package:flutter/material.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/models/index.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    required this.cart,
    super.key,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Id: ${cart.id}, '
        'UserId: ${cart.userId}, '
        '${DateFormat.yMMMMEEEEd().format(cart.date ?? DateTime.now())}',
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
    final product = cart.products?[index] ?? const Product();

    return Text(
      'Product id: ${product.productId}, quantity: ${product.quantity}.',
    );
  }
}
