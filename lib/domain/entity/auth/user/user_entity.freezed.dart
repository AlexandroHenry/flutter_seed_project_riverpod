// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEntity {

 String get id; String get name; String get nickname; String get email; String get phone; String get address; String get city; String get state; String get zip; String get role; String get country; String get createdAt; String get updatedAt; String get sex; String get birth; String get profileImage; String get profileImageUrl; String get profileImageThumbnailUrl;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);

  /// Serializes this UserEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.role, role) || other.role == role)&&(identical(other.country, country) || other.country == country)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.birth, birth) || other.birth == birth)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.profileImageThumbnailUrl, profileImageThumbnailUrl) || other.profileImageThumbnailUrl == profileImageThumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,email,phone,address,city,state,zip,role,country,createdAt,updatedAt,sex,birth,profileImage,profileImageUrl,profileImageThumbnailUrl);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, nickname: $nickname, email: $email, phone: $phone, address: $address, city: $city, state: $state, zip: $zip, role: $role, country: $country, createdAt: $createdAt, updatedAt: $updatedAt, sex: $sex, birth: $birth, profileImage: $profileImage, profileImageUrl: $profileImageUrl, profileImageThumbnailUrl: $profileImageThumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nickname, String email, String phone, String address, String city, String state, String zip, String role, String country, String createdAt, String updatedAt, String sex, String birth, String profileImage, String profileImageUrl, String profileImageThumbnailUrl
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nickname = null,Object? email = null,Object? phone = null,Object? address = null,Object? city = null,Object? state = null,Object? zip = null,Object? role = null,Object? country = null,Object? createdAt = null,Object? updatedAt = null,Object? sex = null,Object? birth = null,Object? profileImage = null,Object? profileImageUrl = null,Object? profileImageThumbnailUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zip: null == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String,birth: null == birth ? _self.birth : birth // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: null == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String,profileImageThumbnailUrl: null == profileImageThumbnailUrl ? _self.profileImageThumbnailUrl : profileImageThumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEntity].
extension UserEntityPatterns on UserEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nickname,  String email,  String phone,  String address,  String city,  String state,  String zip,  String role,  String country,  String createdAt,  String updatedAt,  String sex,  String birth,  String profileImage,  String profileImageUrl,  String profileImageThumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.email,_that.phone,_that.address,_that.city,_that.state,_that.zip,_that.role,_that.country,_that.createdAt,_that.updatedAt,_that.sex,_that.birth,_that.profileImage,_that.profileImageUrl,_that.profileImageThumbnailUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nickname,  String email,  String phone,  String address,  String city,  String state,  String zip,  String role,  String country,  String createdAt,  String updatedAt,  String sex,  String birth,  String profileImage,  String profileImageUrl,  String profileImageThumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _UserEntity():
return $default(_that.id,_that.name,_that.nickname,_that.email,_that.phone,_that.address,_that.city,_that.state,_that.zip,_that.role,_that.country,_that.createdAt,_that.updatedAt,_that.sex,_that.birth,_that.profileImage,_that.profileImageUrl,_that.profileImageThumbnailUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nickname,  String email,  String phone,  String address,  String city,  String state,  String zip,  String role,  String country,  String createdAt,  String updatedAt,  String sex,  String birth,  String profileImage,  String profileImageUrl,  String profileImageThumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _UserEntity() when $default != null:
return $default(_that.id,_that.name,_that.nickname,_that.email,_that.phone,_that.address,_that.city,_that.state,_that.zip,_that.role,_that.country,_that.createdAt,_that.updatedAt,_that.sex,_that.birth,_that.profileImage,_that.profileImageUrl,_that.profileImageThumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEntity implements UserEntity {
  const _UserEntity({this.id = '', this.name = '', this.nickname = '', this.email = '', this.phone = '', this.address = '', this.city = '', this.state = '', this.zip = '', this.role = '', this.country = '', this.createdAt = '', this.updatedAt = '', this.sex = '', this.birth = '', this.profileImage = '', this.profileImageUrl = '', this.profileImageThumbnailUrl = ''});
  factory _UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String nickname;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String address;
@override@JsonKey() final  String city;
@override@JsonKey() final  String state;
@override@JsonKey() final  String zip;
@override@JsonKey() final  String role;
@override@JsonKey() final  String country;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String updatedAt;
@override@JsonKey() final  String sex;
@override@JsonKey() final  String birth;
@override@JsonKey() final  String profileImage;
@override@JsonKey() final  String profileImageUrl;
@override@JsonKey() final  String profileImageThumbnailUrl;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.role, role) || other.role == role)&&(identical(other.country, country) || other.country == country)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sex, sex) || other.sex == sex)&&(identical(other.birth, birth) || other.birth == birth)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.profileImageThumbnailUrl, profileImageThumbnailUrl) || other.profileImageThumbnailUrl == profileImageThumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nickname,email,phone,address,city,state,zip,role,country,createdAt,updatedAt,sex,birth,profileImage,profileImageUrl,profileImageThumbnailUrl);

@override
String toString() {
  return 'UserEntity(id: $id, name: $name, nickname: $nickname, email: $email, phone: $phone, address: $address, city: $city, state: $state, zip: $zip, role: $role, country: $country, createdAt: $createdAt, updatedAt: $updatedAt, sex: $sex, birth: $birth, profileImage: $profileImage, profileImageUrl: $profileImageUrl, profileImageThumbnailUrl: $profileImageThumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nickname, String email, String phone, String address, String city, String state, String zip, String role, String country, String createdAt, String updatedAt, String sex, String birth, String profileImage, String profileImageUrl, String profileImageThumbnailUrl
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nickname = null,Object? email = null,Object? phone = null,Object? address = null,Object? city = null,Object? state = null,Object? zip = null,Object? role = null,Object? country = null,Object? createdAt = null,Object? updatedAt = null,Object? sex = null,Object? birth = null,Object? profileImage = null,Object? profileImageUrl = null,Object? profileImageThumbnailUrl = null,}) {
  return _then(_UserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zip: null == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,sex: null == sex ? _self.sex : sex // ignore: cast_nullable_to_non_nullable
as String,birth: null == birth ? _self.birth : birth // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: null == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String,profileImageThumbnailUrl: null == profileImageThumbnailUrl ? _self.profileImageThumbnailUrl : profileImageThumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
