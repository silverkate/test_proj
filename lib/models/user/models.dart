import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    Address? address,
    int? id,
    String? email,
    String? username,
    String? password,
    Name? name,
    String? phone,
    int? v,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name({
    String? firstname,
    String? lastname,
  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

@freezed
class Geolocation with _$Geolocation {
  const factory Geolocation({
    String? lat,
    String? long,
  }) = _Geolocation;

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);
}

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
