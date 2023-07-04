import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/models/index.dart';

@Injectable(scope: 'auth')
class ProductModalFormBloc extends FormBloc<Product, String> {
  late TextFieldBloc title;
  late TextFieldBloc description;
  late TextFieldBloc price;
  late SelectFieldBloc<String> category;

  final Product? product;
  final StxCategoriesBloc categoriesBloc;
  final StxProductsBloc productsBloc;

  ProductModalFormBloc({
    @factoryParam this.product,
    required this.categoriesBloc,
    required this.productsBloc,
  }) : super(
          /// If [customSubmit] - true, we need to manually handle progresses
          /// and success, error emits.
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

    final categories = categoriesBloc.state.data;

    category = SelectFieldBloc(
      initialValue: product?.category,
      required: true,
      // is the same as FieldBlocValidators.required
      customValidators: {FieldBlocValidators.requiredValidator},
      rules: {ValidationType.onBlur},
      options: categories,
    );

    addFields([
      /// Only this fields are to be validated on submit.
      title,
      description,
      price,
      category,
    ]);

    addSubscription(
      title.valueStream.listen((value) {
        if (value == 'test') {
          removeField(description);

          description.toString();
        } else {
          addField(description);
        }
      }),
    );
  }

  /// Is executed when we call submit from screen.
  @override
  FutureOr<void> onSubmit() {
    var payload = product ?? const Product();

    payload = payload.copyWith(
      title: title.value ?? '',
      description: description.value ?? '',
      category: category.value ?? '',
      price: price.valueToDouble ?? 0.0,
    );

    emitSuccess(payload);
  }
}
