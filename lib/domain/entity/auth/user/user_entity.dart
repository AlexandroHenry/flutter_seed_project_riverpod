import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    @Default('') String id,
    @Default('') String name,
    @Default('') String nickname,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String address,
    @Default('') String city,
    @Default('') String state,
    @Default('') String zip,
    @Default('') String role,
    @Default('') String country,
    @Default('') String createdAt,
    @Default('') String updatedAt,
    @Default('') String sex,
    @Default('') String birth,
    @Default('') String profileImage,
    @Default('') String profileImageUrl,
    @Default('') String profileImageThumbnailUrl,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);
}
