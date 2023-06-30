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
    context.read<StxProductsBloc>().add(NetworkEventLoadAsync());
    context.read<StxCategoriesBloc>().add(NetworkEventLoadAsync());

    return this;
  }

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _editingController = TextEditingController();

  Timer? _debouncer;

  ValueNotifier<String?> _category = ValueNotifier(null);

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
          final bloc = context.read<StxProductsBloc>()
            ..add(NetworkEventLoadAsync());
          _category.value = null;

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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<StxCategoriesBloc, NetworkListState<String>>(
                  builder: (context, state) {
                    return ValueListenableBuilder(
                      valueListenable: _category,
                      builder: (_, category, __) => DropdownButton<String?>(
                        value: category,
                        hint: Text(LocaleKeys.category.tr()),
                        items: state.data.map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: _setNewCategory,
                      ),
                    );
                  },
                ),
              ),
            ),
            BlocBuilder<StxProductsBloc, NetworkListState<Product>>(
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
                          final product = state.data[index];

                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: ProductWidget(product: product),
                          );
                        },
                        childCount: state.data.length,
                      ),
                    );

                  case NetworkStatus.failure:
                    return SliverFillRemaining(
                      child: Center(child: Text(state.errorMsg ?? '')),
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
    _category.value = null;

    if (_debouncer?.isActive ?? false) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(milliseconds: 500), () {
      context.read<StxProductsBloc>().search(query);
    });
  }

  void _setNewCategory(String? newCategory) {
    _category.value = newCategory;

    context.read<StxProductsBloc>().filter(newCategory ?? '');
  }
}
