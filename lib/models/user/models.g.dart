// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      id: json['id'] as int?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'v': instance.v,
    };

_$_Name _$$_NameFromJson(Map<String, dynamic> json) => _$_Name(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$$_NameToJson(_$_Name instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

_$_Geolocation _$$_GeolocationFromJson(Map<String, dynamic> json) =>
    _$_Geolocation(
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$$_GeolocationToJson(_$_Geolocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      geolocation: json['geolocation'] == null
          ? null
          : Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>),
      city: json['city'] as String?,
      street: json['street'] as String?,
      number: json['number'] as int?,
      zipcode: json['zipcode'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'geolocation': instance.geolocation,
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
    };
