// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  address: json['address'] as String? ?? '',
  city: json['city'] as String? ?? '',
  state: json['state'] as String? ?? '',
  zip: json['zip'] as String? ?? '',
  role: json['role'] as String? ?? '',
  country: json['country'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
  updatedAt: json['updatedAt'] as String? ?? '',
  sex: json['sex'] as String? ?? '',
  birth: json['birth'] as String? ?? '',
  profileImage: json['profileImage'] as String? ?? '',
  profileImageUrl: json['profileImageUrl'] as String? ?? '',
  profileImageThumbnailUrl: json['profileImageThumbnailUrl'] as String? ?? '',
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'role': instance.role,
      'country': instance.country,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'sex': instance.sex,
      'birth': instance.birth,
      'profileImage': instance.profileImage,
      'profileImageUrl': instance.profileImageUrl,
      'profileImageThumbnailUrl': instance.profileImageThumbnailUrl,
    };
