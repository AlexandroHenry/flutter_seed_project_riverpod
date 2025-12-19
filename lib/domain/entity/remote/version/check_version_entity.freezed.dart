// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_version_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckVersionEntity {

 AppVersionEntity get appVersion; String get currentVersion; String get lastestVersion; String get storeUrl; bool get needUpdate;
/// Create a copy of CheckVersionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckVersionEntityCopyWith<CheckVersionEntity> get copyWith => _$CheckVersionEntityCopyWithImpl<CheckVersionEntity>(this as CheckVersionEntity, _$identity);

  /// Serializes this CheckVersionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckVersionEntity&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.currentVersion, currentVersion) || other.currentVersion == currentVersion)&&(identical(other.lastestVersion, lastestVersion) || other.lastestVersion == lastestVersion)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl)&&(identical(other.needUpdate, needUpdate) || other.needUpdate == needUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appVersion,currentVersion,lastestVersion,storeUrl,needUpdate);

@override
String toString() {
  return 'CheckVersionEntity(appVersion: $appVersion, currentVersion: $currentVersion, lastestVersion: $lastestVersion, storeUrl: $storeUrl, needUpdate: $needUpdate)';
}


}

/// @nodoc
abstract mixin class $CheckVersionEntityCopyWith<$Res>  {
  factory $CheckVersionEntityCopyWith(CheckVersionEntity value, $Res Function(CheckVersionEntity) _then) = _$CheckVersionEntityCopyWithImpl;
@useResult
$Res call({
 AppVersionEntity appVersion, String currentVersion, String lastestVersion, String storeUrl, bool needUpdate
});


$AppVersionEntityCopyWith<$Res> get appVersion;

}
/// @nodoc
class _$CheckVersionEntityCopyWithImpl<$Res>
    implements $CheckVersionEntityCopyWith<$Res> {
  _$CheckVersionEntityCopyWithImpl(this._self, this._then);

  final CheckVersionEntity _self;
  final $Res Function(CheckVersionEntity) _then;

/// Create a copy of CheckVersionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appVersion = null,Object? currentVersion = null,Object? lastestVersion = null,Object? storeUrl = null,Object? needUpdate = null,}) {
  return _then(_self.copyWith(
appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as AppVersionEntity,currentVersion: null == currentVersion ? _self.currentVersion : currentVersion // ignore: cast_nullable_to_non_nullable
as String,lastestVersion: null == lastestVersion ? _self.lastestVersion : lastestVersion // ignore: cast_nullable_to_non_nullable
as String,storeUrl: null == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String,needUpdate: null == needUpdate ? _self.needUpdate : needUpdate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CheckVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppVersionEntityCopyWith<$Res> get appVersion {
  
  return $AppVersionEntityCopyWith<$Res>(_self.appVersion, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckVersionEntity].
extension CheckVersionEntityPatterns on CheckVersionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckVersionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckVersionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckVersionEntity value)  $default,){
final _that = this;
switch (_that) {
case _CheckVersionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckVersionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CheckVersionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppVersionEntity appVersion,  String currentVersion,  String lastestVersion,  String storeUrl,  bool needUpdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckVersionEntity() when $default != null:
return $default(_that.appVersion,_that.currentVersion,_that.lastestVersion,_that.storeUrl,_that.needUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppVersionEntity appVersion,  String currentVersion,  String lastestVersion,  String storeUrl,  bool needUpdate)  $default,) {final _that = this;
switch (_that) {
case _CheckVersionEntity():
return $default(_that.appVersion,_that.currentVersion,_that.lastestVersion,_that.storeUrl,_that.needUpdate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppVersionEntity appVersion,  String currentVersion,  String lastestVersion,  String storeUrl,  bool needUpdate)?  $default,) {final _that = this;
switch (_that) {
case _CheckVersionEntity() when $default != null:
return $default(_that.appVersion,_that.currentVersion,_that.lastestVersion,_that.storeUrl,_that.needUpdate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckVersionEntity implements CheckVersionEntity {
  const _CheckVersionEntity({this.appVersion = const AppVersionEntity(), this.currentVersion = '', this.lastestVersion = '', this.storeUrl = '', this.needUpdate = false});
  factory _CheckVersionEntity.fromJson(Map<String, dynamic> json) => _$CheckVersionEntityFromJson(json);

@override@JsonKey() final  AppVersionEntity appVersion;
@override@JsonKey() final  String currentVersion;
@override@JsonKey() final  String lastestVersion;
@override@JsonKey() final  String storeUrl;
@override@JsonKey() final  bool needUpdate;

/// Create a copy of CheckVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckVersionEntityCopyWith<_CheckVersionEntity> get copyWith => __$CheckVersionEntityCopyWithImpl<_CheckVersionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckVersionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckVersionEntity&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.currentVersion, currentVersion) || other.currentVersion == currentVersion)&&(identical(other.lastestVersion, lastestVersion) || other.lastestVersion == lastestVersion)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl)&&(identical(other.needUpdate, needUpdate) || other.needUpdate == needUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appVersion,currentVersion,lastestVersion,storeUrl,needUpdate);

@override
String toString() {
  return 'CheckVersionEntity(appVersion: $appVersion, currentVersion: $currentVersion, lastestVersion: $lastestVersion, storeUrl: $storeUrl, needUpdate: $needUpdate)';
}


}

/// @nodoc
abstract mixin class _$CheckVersionEntityCopyWith<$Res> implements $CheckVersionEntityCopyWith<$Res> {
  factory _$CheckVersionEntityCopyWith(_CheckVersionEntity value, $Res Function(_CheckVersionEntity) _then) = __$CheckVersionEntityCopyWithImpl;
@override @useResult
$Res call({
 AppVersionEntity appVersion, String currentVersion, String lastestVersion, String storeUrl, bool needUpdate
});


@override $AppVersionEntityCopyWith<$Res> get appVersion;

}
/// @nodoc
class __$CheckVersionEntityCopyWithImpl<$Res>
    implements _$CheckVersionEntityCopyWith<$Res> {
  __$CheckVersionEntityCopyWithImpl(this._self, this._then);

  final _CheckVersionEntity _self;
  final $Res Function(_CheckVersionEntity) _then;

/// Create a copy of CheckVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appVersion = null,Object? currentVersion = null,Object? lastestVersion = null,Object? storeUrl = null,Object? needUpdate = null,}) {
  return _then(_CheckVersionEntity(
appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as AppVersionEntity,currentVersion: null == currentVersion ? _self.currentVersion : currentVersion // ignore: cast_nullable_to_non_nullable
as String,lastestVersion: null == lastestVersion ? _self.lastestVersion : lastestVersion // ignore: cast_nullable_to_non_nullable
as String,storeUrl: null == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String,needUpdate: null == needUpdate ? _self.needUpdate : needUpdate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CheckVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppVersionEntityCopyWith<$Res> get appVersion {
  
  return $AppVersionEntityCopyWith<$Res>(_self.appVersion, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}
}

// dart format on
