import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_proj/models/geolocation/models.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    Geolocation? geolocation,
    String? city,
    String? street,
    int? number,
    String? zipcode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
