import 'package:flutter/material.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/router/index.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.products.tr())),
      body: Center(
        child: Text(LocaleKeys.products.tr()),
      ),
    );
  }
}
