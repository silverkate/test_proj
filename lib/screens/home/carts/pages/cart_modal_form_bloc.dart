import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/models/index.dart';

@Injectable()
class CartModalBloc extends FormBloc<Cart, String> {
  late NumberFieldBloc userId;
  late DateTimeFieldBloc date;

  GroupFieldBloc<GroupFieldBloc<NumberFieldBloc>> products = GroupFieldBloc();

  final Cart? cart;

  CartModalBloc({
    @factoryParam this.cart,
  }) : super(
          customSubmit: false,
          isEditing: cart != null,
        ) {
    userId = NumberFieldBloc(
      initialValue: cart?.userId,
      required: true,
      rules: {ValidationType.onBlur},
    );

    date = DateTimeFieldBloc(
      initialValue: cart?.date,
      required: true,
      rules: {ValidationType.onBlur},
    );

    for (final element in cart?.products ?? [const CartProduct()]) {
      addProduct(element);
    }

    addFields([
      userId,
      date,
      products,
    ]);
  }

  @override
  FutureOr<void> onSubmit() {
    try {
      var payload = cart ?? const Cart();

      payload = payload.copyWith(
        products: products.fields
            .map(
              (element) => CartProduct(
                productId: element.fields[0].value,
                quantity: element.fields[1].value,
              ),
            )
            .toList(),
        userId: userId.value,
        date: date.value,
      );

      emitSuccess(payload);
    } catch (error, stacktrace) {
      addError(error, stacktrace);

      emitFailure(error.toString());
    }
  }

  void addProduct(CartProduct? product) {
    products.addFieldBloc(
      GroupFieldBloc(
        fieldBlocs: [
          NumberFieldBloc(
            initialValue: product?.productId,
            required: true,
            rules: {ValidationType.onBlur},
          ),
          NumberFieldBloc(
            initialValue: product?.quantity,
            required: true,
            rules: {ValidationType.onBlur},
          ),
        ],
      ),
    );
  }
}
