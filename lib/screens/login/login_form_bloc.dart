import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/repositories/auth_repository.dart';

@Injectable(scope: 'auth')
class LoginFormBloc extends FormBloc<String, String> {
  late TextFieldBloc username;
  late TextFieldBloc password;

  final AuthBloc authBloc;
  final AuthRepository repository;

  LoginFormBloc({
    required this.authBloc,
    required this.repository,
  }) : super(customSubmit: false) {
    username = TextFieldBloc(
      initialValue: 'mor_2314',
      required: true,
      rules: {ValidationType.onBlur},
    );

    password = TextFieldBloc(
      initialValue: '83r5^_',
      required: true,
      customValidators: {FieldBlocValidators.passwordMin6Chars},
      rules: {ValidationType.onBlur},
    );

    addFields([
      username,
      password,
    ]);
  }

  @override
  FutureOr<void> onSubmit() async {
    await repository.signIn(username.toString(), password.toString());

    emitSuccess('Success');
  }
}
