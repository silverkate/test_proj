import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    int? id,
    int? userId,
    DateTime? date,
    List<CartProduct>? products,
    int? v,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    int? productId,
    int? quantity,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
