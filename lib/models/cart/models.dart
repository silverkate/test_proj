import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    int? id,
    int? userId,
    DateTime? date,
    List<Product>? products,
    int? v,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    int? productId,
    int? quantity,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
