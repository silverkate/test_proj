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
import 'package:test_proj/blocs/auth/auth_bloc.dart' as _i18;
import 'package:test_proj/blocs/index.dart' as _i15;
import 'package:test_proj/models/index.dart' as _i14;
import 'package:test_proj/repositories/auth_repository.dart' as _i17;
import 'package:test_proj/repositories/chats_repository.dart' as _i3;
import 'package:test_proj/repositories/index.dart' as _i11;
import 'package:test_proj/repositories/posts_repository.dart' as _i5;
import 'package:test_proj/repositories/product_repository.dart' as _i6;
import 'package:test_proj/repositories/user_repository.dart' as _i16;
import 'package:test_proj/screens/home/messages/chats/bloc/chats_bloc.dart'
    as _i10;
import 'package:test_proj/screens/home/messages/posts/posts_bloc.dart' as _i12;
import 'package:test_proj/screens/home/products/bloc/products_bloc.dart' as _i7;
import 'package:test_proj/screens/home/products/pages/edit_product_form_bloc.dart'
    as _i13;
import 'package:test_proj/screens/home/products/stx_categories_bloc.dart'
    as _i8;
import 'package:test_proj/screens/home/products/stx_products_bloc.dart' as _i9;
import 'package:test_proj/screens/login/login_form_bloc.dart' as _i19;
import 'package:test_proj/services/http/http_client.dart' as _i4;

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
    gh.factory<_i3.ChatsRepository>(
        () => _i3.ChatsRepository(gh<_i4.HttpClient>()));
    gh.factory<_i5.PostsRepository>(
        () => _i5.PostsRepository(gh<_i4.HttpClient>()));
    gh.factory<_i6.ProductRepository>(
        () => _i6.ProductRepository(gh<_i4.HttpClient>()));
    gh.lazySingleton<_i7.ProductsBloc>(
        () => _i7.ProductsBloc(repository: gh<_i6.ProductRepository>()));
    gh.lazySingleton<_i8.StxCategoriesBloc>(
        () => _i8.StxCategoriesBloc(gh<_i6.ProductRepository>()));
    gh.lazySingleton<_i9.StxProductsBloc>(
        () => _i9.StxProductsBloc(gh<_i6.ProductRepository>()));
    gh.lazySingleton<_i10.ChatsBloc>(
        () => _i10.ChatsBloc(repository: gh<_i11.ChatsRepository>()));
    gh.lazySingleton<_i12.PostsBloc>(
        () => _i12.PostsBloc(gh<_i11.PostsRepository>()));
    return this;
  }

// initializes the registration of auth-scope dependencies inside of GetIt
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.factoryParam<_i13.EditProductFormBloc, _i14.Product?, dynamic>((
          product,
          _,
        ) =>
            _i13.EditProductFormBloc(
              productsBloc: gh<_i15.StxProductsBloc>(),
              product: product,
            ));
        gh.singleton<_i4.HttpClient>(_i4.HttpClient());
        gh.factory<_i16.UserRepository>(
            () => _i16.UserRepository(gh<_i4.HttpClient>()));
        gh.factory<_i17.AuthRepository>(
            () => _i17.AuthRepository(gh<_i4.HttpClient>()));
        gh.singleton<_i18.AuthBloc>(_i18.AuthBloc(
          authRepository: gh<_i11.AuthRepository>(),
          userRepository: gh<_i11.UserRepository>(),
        ));
        gh.factory<_i19.LoginFormBloc>(() => _i19.LoginFormBloc(
              authBloc: gh<_i15.AuthBloc>(),
              repository: gh<_i17.AuthRepository>(),
            ));
      },
    );
  }
}
