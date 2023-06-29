import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_proj/models/address/models.dart';
import 'package:test_proj/models/name/models.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonSerializable() Address? address,
    int? id,
    String? email,
    String? username,
    String? password,
    @JsonSerializable() Name? name,
    String? phone,
    int? v,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
