import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    //
    @Default('') String title,
    // text input - keywordType - textfield, only digits - mask (via constructor), keyboard type, not more than 3 symbols
    @Default(0.0) double price,
    // not text input - textAreaInput (max lines - 4 lines),
    @Default('') String description,
    // dropdown - options from category bloc, SingleSelectFormBuilder - create such separate widget with SelectFieldBloc
    @Default('') String category,
    @Default('') String image,
    Rating? rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    double? rate,
    int? count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
