import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: AuthRoute.page,
      children: [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: HomeRouter.page,
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
              children: [
                AutoRoute(page: DashboardRoute.page),
                AutoRoute(page: UsersRoute.page),
                AutoRoute(page: CartsRoute.page),
                AutoRoute(page: ProductsRoute.page),
                AutoRoute(
                  page: MessagesRoute.page,
                  children: [
                    AutoRoute(page: ChatsRoute.page),
                    AutoRoute(page: PostsRoute.page),
                  ],
                ),
                AutoRoute(page: SettingsRoute.page),
              ],
            ),

            /// To show the page above all the nested ones, register them
            /// outside of them all.
            AutoRoute(page: ChatDetailsRoute.page),
            AutoRoute(page: CartModalRoute.page),
            AutoRoute(page: ProductModalRoute.page),
            AutoRoute(
              page: UserModalRoute.page,
              children: [
                // products - override repository
                // carts - override repository
                AutoRoute(page: ProductsRoute.page),
                AutoRoute(page: CartsRoute.page),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
