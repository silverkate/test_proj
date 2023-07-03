import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/models/index.dart';

@Injectable(scope: 'auth')
class EditProductFormBloc extends FormBloc<String, String> {
  late TextFieldBloc title;
  late TextFieldBloc description;
  late TextFieldBloc price;
  late TextFieldBloc category;

  final StxProductsBloc productsBloc;
  final Product? product;

  EditProductFormBloc({
    required this.productsBloc,
    @factoryParam this.product,
  }) : super(
          /// If [customSubmit] - true, we need to manually handle progresses and
          /// success, error emits.
          customSubmit: false,
          isEditing: product != null,
        ) {
    title = TextFieldBloc(
      initialValue: product?.title,
      required: true,
      rules: {ValidationType.onBlur},
    );

    description = TextFieldBloc(
      initialValue: product?.description,
      required: true, // is the same as FieldBlocValidators.required
      customValidators: {FieldBlocValidators.requiredValidator},
      rules: {ValidationType.onBlur},
    );

    price = TextFieldBloc(
      initialValue: product?.price.toString(),
      required: true, // is the same as FieldBlocValidators.required
      customValidators: {FieldBlocValidators.requiredValidator},
      rules: {ValidationType.onBlur},
    );

    category = TextFieldBloc(
      initialValue: product?.category,
      required: true, // is the same as FieldBlocValidators.required
      customValidators: {FieldBlocValidators.requiredValidator},
      rules: {ValidationType.onBlur},
    );

    addFields([
      /// Only this fields are to be validated on submit.
      title,
      description,
      price,
      category,
    ]);
  }

  @override
  FutureOr<void> onInitialize(Map<String, dynamic> params) {
    // get categories when opening modal screen

    return super.onInitialize(params);
  }

  /// Is executed when we call submit from screen.
  @override
  Future<FutureOr<void>> onSubmit() async {
    try {
      emitSuccess('Success');
    } catch (error, stacktrace) {
      addError(error, stacktrace);

      emitFailure(error.toString());
    }
  }
}
