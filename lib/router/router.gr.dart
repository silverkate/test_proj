// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:test_proj/models/index.dart' as _i15;
import 'package:test_proj/screens/auth_screen.dart' as _i10;
import 'package:test_proj/screens/home/dashboard/dashboard_screen.dart' as _i6;
import 'package:test_proj/screens/home/home_screen.dart' as _i8;
import 'package:test_proj/screens/home/home_wrapper.dart' as _i7;
import 'package:test_proj/screens/home/messages/chats/chats_screen.dart' as _i4;
import 'package:test_proj/screens/home/messages/chats/pages/chat_details/chat_details_screen.dart'
    as _i5;
import 'package:test_proj/screens/home/messages/messages_screen.dart' as _i3;
import 'package:test_proj/screens/home/messages/posts/posts_screen.dart' as _i2;
import 'package:test_proj/screens/home/products/pages/product_modal_screen.dart'
    as _i12;
import 'package:test_proj/screens/home/products/products_screen.dart' as _i11;
import 'package:test_proj/screens/home/settings/settings_screen.dart' as _i1;
import 'package:test_proj/screens/login/login_screen.dart' as _i9;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsScreen(),
      );
    },
    PostsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i2.PostsScreen()),
      );
    },
    MessagesRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MessagesScreen(),
      );
    },
    ChatsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i4.ChatsScreen()),
      );
    },
    ChatDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ChatDetailsRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChatDetailsScreen(
          key: args.key,
          chat: args.chat,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DashboardScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeWrapperScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i9.LoginScreen()),
      );
    },
    AuthRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AuthScreen(),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i11.ProductsScreen()),
      );
    },
    ProductModalRoute.name: (routeData) {
      final args = routeData.argsAs<ProductModalRouteArgs>(
          orElse: () => const ProductModalRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(
            child: _i12.ProductModalScreen(
          product: args.product,
          key: args.key,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsScreen]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostsScreen]
class PostsRoute extends _i13.PageRouteInfo<void> {
  const PostsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MessagesScreen]
class MessagesRoute extends _i13.PageRouteInfo<void> {
  const MessagesRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MessagesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatsScreen]
class ChatsRoute extends _i13.PageRouteInfo<void> {
  const ChatsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ChatDetailsScreen]
class ChatDetailsRoute extends _i13.PageRouteInfo<ChatDetailsRouteArgs> {
  ChatDetailsRoute({
    _i14.Key? key,
    required _i15.Chat chat,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ChatDetailsRoute.name,
          args: ChatDetailsRouteArgs(
            key: key,
            chat: chat,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatDetailsRoute';

  static const _i13.PageInfo<ChatDetailsRouteArgs> page =
      _i13.PageInfo<ChatDetailsRouteArgs>(name);
}

class ChatDetailsRouteArgs {
  const ChatDetailsRouteArgs({
    this.key,
    required this.chat,
  });

  final _i14.Key? key;

  final _i15.Chat chat;

  @override
  String toString() {
    return 'ChatDetailsRouteArgs{key: $key, chat: $chat}';
  }
}

/// generated route for
/// [_i6.DashboardScreen]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeWrapperScreen]
class HomeRouter extends _i13.PageRouteInfo<void> {
  const HomeRouter({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.AuthScreen]
class AuthRoute extends _i13.PageRouteInfo<void> {
  const AuthRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProductsScreen]
class ProductsRoute extends _i13.PageRouteInfo<void> {
  const ProductsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProductModalScreen]
class ProductModalRoute extends _i13.PageRouteInfo<ProductModalRouteArgs> {
  ProductModalRoute({
    _i15.Product? product,
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProductModalRoute.name,
          args: ProductModalRouteArgs(
            product: product,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductModalRoute';

  static const _i13.PageInfo<ProductModalRouteArgs> page =
      _i13.PageInfo<ProductModalRouteArgs>(name);
}

class ProductModalRouteArgs {
  const ProductModalRouteArgs({
    this.product,
    this.key,
  });

  final _i15.Product? product;

  final _i14.Key? key;

  @override
  String toString() {
    return 'ProductModalRouteArgs{product: $product, key: $key}';
  }
}
