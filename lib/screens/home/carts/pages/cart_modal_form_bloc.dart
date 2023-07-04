import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/screens/home/carts/carts_bloc.dart';

@Injectable(scope: 'auth')
class CartModalBloc extends FormBloc<String, String> {
  final Cart? cart;

  late TextFieldBloc userId;
  late TextFieldBloc date;
  late ListFieldBloc<Product> products;

  final CartsBloc cartBloc;

  CartModalBloc({
    required this.cartBloc,
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
      /// Only this fields are to be validated on submit.
      userId,
      date,
    ]);
  }

  /// Is executed when we call submit from screen.
  @override
  FutureOr<void> onSubmit() {
    try {
      if (state.isEditing) {
        const editedProduct = Cart();

        cartBloc.editItem(editedProduct);
      } else {
        const cart = Cart();

        cartBloc.addItem(cart);
      }

      emitSuccess('Success');
    } catch (error, stacktrace) {
      addError(error, stacktrace);

      emitFailure(error.toString());
    }
  }
}
