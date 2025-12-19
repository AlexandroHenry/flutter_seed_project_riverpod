// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VersionEntity {

 AppVersionEntity get appVersion;
/// Create a copy of VersionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionEntityCopyWith<VersionEntity> get copyWith => _$VersionEntityCopyWithImpl<VersionEntity>(this as VersionEntity, _$identity);

  /// Serializes this VersionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionEntity&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appVersion);

@override
String toString() {
  return 'VersionEntity(appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class $VersionEntityCopyWith<$Res>  {
  factory $VersionEntityCopyWith(VersionEntity value, $Res Function(VersionEntity) _then) = _$VersionEntityCopyWithImpl;
@useResult
$Res call({
 AppVersionEntity appVersion
});


$AppVersionEntityCopyWith<$Res> get appVersion;

}
/// @nodoc
class _$VersionEntityCopyWithImpl<$Res>
    implements $VersionEntityCopyWith<$Res> {
  _$VersionEntityCopyWithImpl(this._self, this._then);

  final VersionEntity _self;
  final $Res Function(VersionEntity) _then;

/// Create a copy of VersionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appVersion = null,}) {
  return _then(_self.copyWith(
appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as AppVersionEntity,
  ));
}
/// Create a copy of VersionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppVersionEntityCopyWith<$Res> get appVersion {
  
  return $AppVersionEntityCopyWith<$Res>(_self.appVersion, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}
}


/// Adds pattern-matching-related methods to [VersionEntity].
extension VersionEntityPatterns on VersionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VersionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VersionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VersionEntity value)  $default,){
final _that = this;
switch (_that) {
case _VersionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VersionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _VersionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppVersionEntity appVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VersionEntity() when $default != null:
return $default(_that.appVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppVersionEntity appVersion)  $default,) {final _that = this;
switch (_that) {
case _VersionEntity():
return $default(_that.appVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppVersionEntity appVersion)?  $default,) {final _that = this;
switch (_that) {
case _VersionEntity() when $default != null:
return $default(_that.appVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VersionEntity implements VersionEntity {
  const _VersionEntity({this.appVersion = const AppVersionEntity()});
  factory _VersionEntity.fromJson(Map<String, dynamic> json) => _$VersionEntityFromJson(json);

@override@JsonKey() final  AppVersionEntity appVersion;

/// Create a copy of VersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionEntityCopyWith<_VersionEntity> get copyWith => __$VersionEntityCopyWithImpl<_VersionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionEntity&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appVersion);

@override
String toString() {
  return 'VersionEntity(appVersion: $appVersion)';
}


}

/// @nodoc
abstract mixin class _$VersionEntityCopyWith<$Res> implements $VersionEntityCopyWith<$Res> {
  factory _$VersionEntityCopyWith(_VersionEntity value, $Res Function(_VersionEntity) _then) = __$VersionEntityCopyWithImpl;
@override @useResult
$Res call({
 AppVersionEntity appVersion
});


@override $AppVersionEntityCopyWith<$Res> get appVersion;

}
/// @nodoc
class __$VersionEntityCopyWithImpl<$Res>
    implements _$VersionEntityCopyWith<$Res> {
  __$VersionEntityCopyWithImpl(this._self, this._then);

  final _VersionEntity _self;
  final $Res Function(_VersionEntity) _then;

/// Create a copy of VersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appVersion = null,}) {
  return _then(_VersionEntity(
appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as AppVersionEntity,
  ));
}

/// Create a copy of VersionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppVersionEntityCopyWith<$Res> get appVersion {
  
  return $AppVersionEntityCopyWith<$Res>(_self.appVersion, (value) {
    return _then(_self.copyWith(appVersion: value));
  });
}
}


/// @nodoc
mixin _$AppVersionEntity {

 String get androidVersion; bool get androidForceUpdate; String get androidReason; String get iosVersion; bool get iosForceUpdate; String get iosReason;
/// Create a copy of AppVersionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppVersionEntityCopyWith<AppVersionEntity> get copyWith => _$AppVersionEntityCopyWithImpl<AppVersionEntity>(this as AppVersionEntity, _$identity);

  /// Serializes this AppVersionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppVersionEntity&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion)&&(identical(other.androidForceUpdate, androidForceUpdate) || other.androidForceUpdate == androidForceUpdate)&&(identical(other.androidReason, androidReason) || other.androidReason == androidReason)&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.iosForceUpdate, iosForceUpdate) || other.iosForceUpdate == iosForceUpdate)&&(identical(other.iosReason, iosReason) || other.iosReason == iosReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidVersion,androidForceUpdate,androidReason,iosVersion,iosForceUpdate,iosReason);

@override
String toString() {
  return 'AppVersionEntity(androidVersion: $androidVersion, androidForceUpdate: $androidForceUpdate, androidReason: $androidReason, iosVersion: $iosVersion, iosForceUpdate: $iosForceUpdate, iosReason: $iosReason)';
}


}

/// @nodoc
abstract mixin class $AppVersionEntityCopyWith<$Res>  {
  factory $AppVersionEntityCopyWith(AppVersionEntity value, $Res Function(AppVersionEntity) _then) = _$AppVersionEntityCopyWithImpl;
@useResult
$Res call({
 String androidVersion, bool androidForceUpdate, String androidReason, String iosVersion, bool iosForceUpdate, String iosReason
});




}
/// @nodoc
class _$AppVersionEntityCopyWithImpl<$Res>
    implements $AppVersionEntityCopyWith<$Res> {
  _$AppVersionEntityCopyWithImpl(this._self, this._then);

  final AppVersionEntity _self;
  final $Res Function(AppVersionEntity) _then;

/// Create a copy of AppVersionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? androidVersion = null,Object? androidForceUpdate = null,Object? androidReason = null,Object? iosVersion = null,Object? iosForceUpdate = null,Object? iosReason = null,}) {
  return _then(_self.copyWith(
androidVersion: null == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as String,androidForceUpdate: null == androidForceUpdate ? _self.androidForceUpdate : androidForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,androidReason: null == androidReason ? _self.androidReason : androidReason // ignore: cast_nullable_to_non_nullable
as String,iosVersion: null == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as String,iosForceUpdate: null == iosForceUpdate ? _self.iosForceUpdate : iosForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,iosReason: null == iosReason ? _self.iosReason : iosReason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppVersionEntity].
extension AppVersionEntityPatterns on AppVersionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppVersionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppVersionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppVersionEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppVersionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppVersionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppVersionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String androidVersion,  bool androidForceUpdate,  String androidReason,  String iosVersion,  bool iosForceUpdate,  String iosReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppVersionEntity() when $default != null:
return $default(_that.androidVersion,_that.androidForceUpdate,_that.androidReason,_that.iosVersion,_that.iosForceUpdate,_that.iosReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String androidVersion,  bool androidForceUpdate,  String androidReason,  String iosVersion,  bool iosForceUpdate,  String iosReason)  $default,) {final _that = this;
switch (_that) {
case _AppVersionEntity():
return $default(_that.androidVersion,_that.androidForceUpdate,_that.androidReason,_that.iosVersion,_that.iosForceUpdate,_that.iosReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String androidVersion,  bool androidForceUpdate,  String androidReason,  String iosVersion,  bool iosForceUpdate,  String iosReason)?  $default,) {final _that = this;
switch (_that) {
case _AppVersionEntity() when $default != null:
return $default(_that.androidVersion,_that.androidForceUpdate,_that.androidReason,_that.iosVersion,_that.iosForceUpdate,_that.iosReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppVersionEntity implements AppVersionEntity {
  const _AppVersionEntity({this.androidVersion = '', this.androidForceUpdate = false, this.androidReason = '', this.iosVersion = '', this.iosForceUpdate = false, this.iosReason = ''});
  factory _AppVersionEntity.fromJson(Map<String, dynamic> json) => _$AppVersionEntityFromJson(json);

@override@JsonKey() final  String androidVersion;
@override@JsonKey() final  bool androidForceUpdate;
@override@JsonKey() final  String androidReason;
@override@JsonKey() final  String iosVersion;
@override@JsonKey() final  bool iosForceUpdate;
@override@JsonKey() final  String iosReason;

/// Create a copy of AppVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppVersionEntityCopyWith<_AppVersionEntity> get copyWith => __$AppVersionEntityCopyWithImpl<_AppVersionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppVersionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppVersionEntity&&(identical(other.androidVersion, androidVersion) || other.androidVersion == androidVersion)&&(identical(other.androidForceUpdate, androidForceUpdate) || other.androidForceUpdate == androidForceUpdate)&&(identical(other.androidReason, androidReason) || other.androidReason == androidReason)&&(identical(other.iosVersion, iosVersion) || other.iosVersion == iosVersion)&&(identical(other.iosForceUpdate, iosForceUpdate) || other.iosForceUpdate == iosForceUpdate)&&(identical(other.iosReason, iosReason) || other.iosReason == iosReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,androidVersion,androidForceUpdate,androidReason,iosVersion,iosForceUpdate,iosReason);

@override
String toString() {
  return 'AppVersionEntity(androidVersion: $androidVersion, androidForceUpdate: $androidForceUpdate, androidReason: $androidReason, iosVersion: $iosVersion, iosForceUpdate: $iosForceUpdate, iosReason: $iosReason)';
}


}

/// @nodoc
abstract mixin class _$AppVersionEntityCopyWith<$Res> implements $AppVersionEntityCopyWith<$Res> {
  factory _$AppVersionEntityCopyWith(_AppVersionEntity value, $Res Function(_AppVersionEntity) _then) = __$AppVersionEntityCopyWithImpl;
@override @useResult
$Res call({
 String androidVersion, bool androidForceUpdate, String androidReason, String iosVersion, bool iosForceUpdate, String iosReason
});




}
/// @nodoc
class __$AppVersionEntityCopyWithImpl<$Res>
    implements _$AppVersionEntityCopyWith<$Res> {
  __$AppVersionEntityCopyWithImpl(this._self, this._then);

  final _AppVersionEntity _self;
  final $Res Function(_AppVersionEntity) _then;

/// Create a copy of AppVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? androidVersion = null,Object? androidForceUpdate = null,Object? androidReason = null,Object? iosVersion = null,Object? iosForceUpdate = null,Object? iosReason = null,}) {
  return _then(_AppVersionEntity(
androidVersion: null == androidVersion ? _self.androidVersion : androidVersion // ignore: cast_nullable_to_non_nullable
as String,androidForceUpdate: null == androidForceUpdate ? _self.androidForceUpdate : androidForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,androidReason: null == androidReason ? _self.androidReason : androidReason // ignore: cast_nullable_to_non_nullable
as String,iosVersion: null == iosVersion ? _self.iosVersion : iosVersion // ignore: cast_nullable_to_non_nullable
as String,iosForceUpdate: null == iosForceUpdate ? _self.iosForceUpdate : iosForceUpdate // ignore: cast_nullable_to_non_nullable
as bool,iosReason: null == iosReason ? _self.iosReason : iosReason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
