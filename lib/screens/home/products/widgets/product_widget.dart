import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      subtitle: Text(product.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _editItem(context),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () => _removeItem(context),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void _removeItem(BuildContext context) {
    context.read<StxProductsBloc>().removeItem(product);
  }

  void _editItem(BuildContext context) {
    context.router.push(
      ProductModalRoute(product: product),
    );
  }
}
