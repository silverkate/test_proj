/// form bloc (separate type)
///
/// we can work with all fields separately
///

// on submit edit or create a product

// submit.success(product)
//

import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/blocs/index.dart';

@Injectable(scope: 'auth')
class EditProductFormBloc extends FormBloc<String, String> {
  late TextFieldBloc title;
  late TextFieldBloc description;
  late TextFieldBloc price;
  late TextFieldBloc category;

  final StxProductsBloc productsBloc;

  EditProductFormBloc({
    required this.productsBloc,
  }) : super(
          customSubmit: false,
        ) {
    //, isEditing: initial != null) {
    // customSubmit - loading handling - emitSuccess, emitFailure
    title = TextFieldBloc(
      required: true,
      rules: {ValidationType.onBlur},
    );

    description = TextFieldBloc(
      initialValue: 'This is one nice product :)',
      required: true, // is the same as FieldBlocValidators.required
      customValidators: {FieldBlocValidators.requiredValidator},
      rules: {ValidationType.onBlur},
    );

    price = TextFieldBloc(
      required: true, // is the same as FieldBlocValidators.required
      customValidators: {FieldBlocValidators.requiredValidator},
      rules: {ValidationType.onBlur},
    );

    category = TextFieldBloc(
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
