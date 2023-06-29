// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:test_proj/blocs/auth/auth_bloc.dart' as _i11;
import 'package:test_proj/blocs/index.dart' as _i13;
import 'package:test_proj/repositories/auth_repository.dart' as _i10;
import 'package:test_proj/repositories/chats_repository.dart' as _i3;
import 'package:test_proj/repositories/index.dart' as _i7;
import 'package:test_proj/repositories/posts_repository.dart' as _i5;
import 'package:test_proj/repositories/user_repository.dart' as _i9;
import 'package:test_proj/screens/home/messages/chats/bloc/chats_bloc.dart'
    as _i6;
import 'package:test_proj/screens/home/messages/posts/posts_bloc.dart'
    as _i8;
import 'package:test_proj/screens/login/login_form_bloc.dart' as _i12;
import 'package:test_proj/services/http/http_client.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.lazySingleton<_i6.ChatsBloc>(
        () => _i6.ChatsBloc(repository: gh<_i7.ChatsRepository>()));
    gh.lazySingleton<_i8.PostsBloc>(
        () => _i8.PostsBloc(gh<_i7.PostsRepository>()));
    return this;
  }

// initializes the registration of auth-scope dependencies inside of GetIt
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.singleton<_i4.HttpClient>(_i4.HttpClient());
        gh.factory<_i9.UserRepository>(
            () => _i9.UserRepository(gh<_i4.HttpClient>()));
        gh.factory<_i10.AuthRepository>(
            () => _i10.AuthRepository(gh<_i4.HttpClient>()));
        gh.singleton<_i11.AuthBloc>(_i11.AuthBloc(
          authRepository: gh<_i7.AuthRepository>(),
          userRepository: gh<_i7.UserRepository>(),
        ));
        gh.factory<_i12.LoginFormBloc>(() => _i12.LoginFormBloc(
              authBloc: gh<_i13.AuthBloc>(),
              repository: gh<_i10.AuthRepository>(),
            ));
      },
    );
  }
}
