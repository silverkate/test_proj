import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/models/index.dart';

@Injectable(scope: 'auth')
class CartModalBloc extends FormBloc<Cart, String> {
  final Cart? cart;

  late TextFieldBloc userId;
  late TextFieldBloc date;
  late ListFieldBloc<Product> products;

  CartModalBloc({
    @factoryParam this.cart,
  }) : super(
          /// If [customSubmit] - true, we need to manually handle progresses
          /// and success, error emits.
          customSubmit: false,
          isEditing: cart != null,
        ) {
    userId = TextFieldBloc(
      initialValue: cart?.userId.toString(),
      required: true,
      rules: {ValidationType.onBlur},
    );

    date = TextFieldBloc(
      initialValue: cart?.date.toString(),
      required: true,
      rules: {ValidationType.onBlur},
    );

    products = ListFieldBloc<Product>(
      required: true,
      rules: {ValidationType.onBlur},
    );

    addFields([
      userId,
      date,
    ]);
  }

  @override
  FutureOr<void> onSubmit() {
    try {
      const cart = Cart();

      emitSuccess(cart);
    } catch (error, stacktrace) {
      addError(error, stacktrace);

      emitFailure(error.toString());
    }
  }
}
