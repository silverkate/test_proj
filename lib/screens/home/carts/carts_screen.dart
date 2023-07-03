import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/screens/home/carts/carts_bloc.dart';
import 'package:test_proj/screens/home/carts/widgets/index.dart';

@RoutePage()
class CartsScreen extends StatelessWidget implements AutoRouteWrapper {
  const CartsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<CartsBloc>().add(NetworkEventLoadAsync());

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);
    final cartsBloc = context.read<CartsBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.carts.tr()),
        actions: [
          IconButton(
            onPressed: () => _addElement(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: cartsBloc.loadAsyncFuture,
        child: CustomScrollView(
          slivers: [
            BlocBuilder<CartsBloc, NetworkListState<Cart>>(
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
                          final cart = state.data[index];

                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: CartWidget(cart: cart),
                          );
                        },
                        childCount: state.data.length,
                      ),
                    );

                  case NetworkStatus.failure:
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(state.errorMsg),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addElement(BuildContext context) {
    context.router.push(CartModalRoute());
  }
}
