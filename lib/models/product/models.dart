import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    @Default('') String title,
    @Default(0.0) double price,
    @Default('') String description,
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
