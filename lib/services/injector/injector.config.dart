// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_proj/blocs/auth/auth_bloc.dart' as _i21;
import 'package:test_proj/blocs/index.dart' as _i18;
import 'package:test_proj/models/index.dart' as _i4;
import 'package:test_proj/repositories/auth_repository.dart' as _i20;
import 'package:test_proj/repositories/carts_repository.dart' as _i5;
import 'package:test_proj/repositories/chats_repository.dart' as _i7;
import 'package:test_proj/repositories/index.dart' as _i15;
import 'package:test_proj/repositories/posts_repository.dart' as _i8;
import 'package:test_proj/repositories/product_repository.dart' as _i9;
import 'package:test_proj/repositories/user_repository.dart' as _i19;
import 'package:test_proj/screens/home/carts/carts_bloc.dart' as _i13;
import 'package:test_proj/screens/home/carts/pages/cart_modal_form_bloc.dart'
    as _i3;
import 'package:test_proj/screens/home/messages/chats/bloc/chats_bloc.dart'
    as _i14;
import 'package:test_proj/screens/home/messages/posts/posts_bloc.dart' as _i16;
import 'package:test_proj/screens/home/products/bloc/products_bloc.dart'
    as _i10;
import 'package:test_proj/screens/home/products/pages/product_modal_form_bloc.dart'
    as _i17;
import 'package:test_proj/screens/home/products/stx_categories_bloc.dart'
    as _i11;
import 'package:test_proj/screens/home/products/stx_products_bloc.dart' as _i12;
import 'package:test_proj/screens/login/login_form_bloc.dart' as _i22;
import 'package:test_proj/services/http/http_client.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factoryParam<_i3.CartModalBloc, _i4.Cart?, dynamic>((
      cart,
      _,
    ) =>
        _i3.CartModalBloc(cart: cart));
    gh.factory<_i5.CartsRepository>(
        () => _i5.CartsRepository(gh<_i6.HttpClient>()));
    gh.factory<_i7.ChatsRepository>(
        () => _i7.ChatsRepository(gh<_i6.HttpClient>()));
    gh.factory<_i8.PostsRepository>(
        () => _i8.PostsRepository(gh<_i6.HttpClient>()));
    gh.factory<_i9.ProductRepository>(
        () => _i9.ProductRepository(gh<_i6.HttpClient>()));
    gh.lazySingleton<_i10.ProductsBloc>(
        () => _i10.ProductsBloc(repository: gh<_i9.ProductRepository>()));
    gh.lazySingleton<_i11.StxCategoriesBloc>(
        () => _i11.StxCategoriesBloc(gh<_i9.ProductRepository>()));
    gh.lazySingleton<_i12.StxProductsBloc>(
        () => _i12.StxProductsBloc(gh<_i9.ProductRepository>()));
    gh.lazySingleton<_i13.CartsBloc>(
        () => _i13.CartsBloc(gh<_i5.CartsRepository>()));
    gh.lazySingleton<_i14.ChatsBloc>(
        () => _i14.ChatsBloc(repository: gh<_i15.ChatsRepository>()));
    gh.lazySingleton<_i16.PostsBloc>(
        () => _i16.PostsBloc(gh<_i15.PostsRepository>()));
    gh.factoryParam<_i17.ProductModalFormBloc, _i4.Product?, dynamic>((
      product,
      _,
    ) =>
        _i17.ProductModalFormBloc(
          product: product,
          categoriesBloc: gh<_i18.StxCategoriesBloc>(),
          productsBloc: gh<_i18.StxProductsBloc>(),
        ));
    return this;
  }

// initializes the registration of auth-scope dependencies inside of GetIt
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.singleton<_i6.HttpClient>(_i6.HttpClient());
        gh.factory<_i19.UserRepository>(
            () => _i19.UserRepository(gh<_i6.HttpClient>()));
        gh.factory<_i20.AuthRepository>(
            () => _i20.AuthRepository(gh<_i6.HttpClient>()));
        gh.singleton<_i21.AuthBloc>(_i21.AuthBloc(
          authRepository: gh<_i15.AuthRepository>(),
          userRepository: gh<_i15.UserRepository>(),
        ));
        gh.factory<_i22.LoginFormBloc>(() => _i22.LoginFormBloc(
              authBloc: gh<_i18.AuthBloc>(),
              repository: gh<_i20.AuthRepository>(),
            ));
      },
    );
  }
}
