import 'package:flutter/material.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/services/index.dart';
import 'package:test_proj/widgets/index.dart';

@RoutePage()
class UserModalScreen extends StatelessWidget with AutoRouteWrapper {
  const UserModalScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    getIt.get<StxProductsBloc>().load();
    getIt.get<CartsBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return AutoTabsScaffold(
      endDrawer: const AppDrawer(),
      routes: const [
        CartsRoute(),
        ProductsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_sharp),
                label: LocaleKeys.carts.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.production_quantity_limits),
                label: LocaleKeys.products.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
