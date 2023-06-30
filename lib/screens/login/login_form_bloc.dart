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
    required this.authBloc, // nullable product if null - create
    required this.repository,
  }) : super(customSubmit: false) {
    //, isEditing: initial != null) {
    // customSubmit - loading handling - emitSuccess, emitFailure
    username = TextFieldBloc(
      initialValue: 'mor_2314',
      required: true,
      rules: {ValidationType.onBlur},
    );

    password = TextFieldBloc(
      initialValue: '83r5^_',
      required: true, // is the same as FieldBlocValidators.required
      customValidators: {FieldBlocValidators.passwordMin6Chars},
      rules: {ValidationType.onBlur},
    );

    addFields([
      // only this fields are validated on submit
      username,
      password,
    ]);
  }

  // onInitialize - i.e. get categories when opening modal screen

  @override
  Future<FutureOr<void>> onSubmit() async {
    // when we call submit from screen
    try {
      await repository.signIn(username.toString(), password.toString());

      emitSuccess('Success');
    } catch (error, stacktrace) {
      addError(error, stacktrace);

      emitFailure(error.toString());
    }
  }
}
