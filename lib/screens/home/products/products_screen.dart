import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/screens/home/products/widgets/product_widget.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProductsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<ProductsBloc>().add(const ProductsEvent.load());

    return this;
  }

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _editingController = TextEditingController();

  Timer? _debouncer;

  @override
  void dispose() {
    _editingController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.products.tr())),
      body: RefreshIndicator(
        onRefresh: () {
          final bloc = context.read<ProductsBloc>()
            ..add(const ProductsEvent.load());

          return bloc.stream
              .firstWhere((state) => state.status != NetworkStatus.loading);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: TextField(
                  controller: _editingController,
                  onChanged: _search,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                  case NetworkStatus.loading:
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  case NetworkStatus.success:
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final product = state.products[index];

                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: ProductWidget(product: product),
                          );
                        },
                        childCount: state.products.length,
                      ),
                    );

                  case NetworkStatus.failure:
                    return SliverFillRemaining(
                      child: Center(child: Text(state.errorMessage ?? '')),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _search(String query) {
    if (_debouncer?.isActive ?? false) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(milliseconds: 500), () {
      context.read<ProductsBloc>().add(ProductsEvent.search(query));
    });
  }
}
