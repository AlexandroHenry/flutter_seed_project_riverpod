// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModalEntity {

 bool get showLoading; bool get loadingTransparent; PopupType get popupType; ModalErrorEntity get error; DialogData get dialogData;
/// Create a copy of ModalEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModalEntityCopyWith<ModalEntity> get copyWith => _$ModalEntityCopyWithImpl<ModalEntity>(this as ModalEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModalEntity&&(identical(other.showLoading, showLoading) || other.showLoading == showLoading)&&(identical(other.loadingTransparent, loadingTransparent) || other.loadingTransparent == loadingTransparent)&&(identical(other.popupType, popupType) || other.popupType == popupType)&&(identical(other.error, error) || other.error == error)&&(identical(other.dialogData, dialogData) || other.dialogData == dialogData));
}


@override
int get hashCode => Object.hash(runtimeType,showLoading,loadingTransparent,popupType,error,dialogData);

@override
String toString() {
  return 'ModalEntity(showLoading: $showLoading, loadingTransparent: $loadingTransparent, popupType: $popupType, error: $error, dialogData: $dialogData)';
}


}

/// @nodoc
abstract mixin class $ModalEntityCopyWith<$Res>  {
  factory $ModalEntityCopyWith(ModalEntity value, $Res Function(ModalEntity) _then) = _$ModalEntityCopyWithImpl;
@useResult
$Res call({
 bool showLoading, bool loadingTransparent, PopupType popupType, ModalErrorEntity error, DialogData dialogData
});


$ModalErrorEntityCopyWith<$Res> get error;

}
/// @nodoc
class _$ModalEntityCopyWithImpl<$Res>
    implements $ModalEntityCopyWith<$Res> {
  _$ModalEntityCopyWithImpl(this._self, this._then);

  final ModalEntity _self;
  final $Res Function(ModalEntity) _then;

/// Create a copy of ModalEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showLoading = null,Object? loadingTransparent = null,Object? popupType = null,Object? error = null,Object? dialogData = null,}) {
  return _then(_self.copyWith(
showLoading: null == showLoading ? _self.showLoading : showLoading // ignore: cast_nullable_to_non_nullable
as bool,loadingTransparent: null == loadingTransparent ? _self.loadingTransparent : loadingTransparent // ignore: cast_nullable_to_non_nullable
as bool,popupType: null == popupType ? _self.popupType : popupType // ignore: cast_nullable_to_non_nullable
as PopupType,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ModalErrorEntity,dialogData: null == dialogData ? _self.dialogData : dialogData // ignore: cast_nullable_to_non_nullable
as DialogData,
  ));
}
/// Create a copy of ModalEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalErrorEntityCopyWith<$Res> get error {
  
  return $ModalErrorEntityCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModalEntity].
extension ModalEntityPatterns on ModalEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModalEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModalEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModalEntity value)  $default,){
final _that = this;
switch (_that) {
case _ModalEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModalEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ModalEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showLoading,  bool loadingTransparent,  PopupType popupType,  ModalErrorEntity error,  DialogData dialogData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModalEntity() when $default != null:
return $default(_that.showLoading,_that.loadingTransparent,_that.popupType,_that.error,_that.dialogData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showLoading,  bool loadingTransparent,  PopupType popupType,  ModalErrorEntity error,  DialogData dialogData)  $default,) {final _that = this;
switch (_that) {
case _ModalEntity():
return $default(_that.showLoading,_that.loadingTransparent,_that.popupType,_that.error,_that.dialogData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showLoading,  bool loadingTransparent,  PopupType popupType,  ModalErrorEntity error,  DialogData dialogData)?  $default,) {final _that = this;
switch (_that) {
case _ModalEntity() when $default != null:
return $default(_that.showLoading,_that.loadingTransparent,_that.popupType,_that.error,_that.dialogData);case _:
  return null;

}
}

}

/// @nodoc


class _ModalEntity implements ModalEntity {
  const _ModalEntity({this.showLoading = false, this.loadingTransparent = false, this.popupType = PopupType.oneButton, this.error = const ModalErrorEntity(), this.dialogData = const DialogData()});
  

@override@JsonKey() final  bool showLoading;
@override@JsonKey() final  bool loadingTransparent;
@override@JsonKey() final  PopupType popupType;
@override@JsonKey() final  ModalErrorEntity error;
@override@JsonKey() final  DialogData dialogData;

/// Create a copy of ModalEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModalEntityCopyWith<_ModalEntity> get copyWith => __$ModalEntityCopyWithImpl<_ModalEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModalEntity&&(identical(other.showLoading, showLoading) || other.showLoading == showLoading)&&(identical(other.loadingTransparent, loadingTransparent) || other.loadingTransparent == loadingTransparent)&&(identical(other.popupType, popupType) || other.popupType == popupType)&&(identical(other.error, error) || other.error == error)&&(identical(other.dialogData, dialogData) || other.dialogData == dialogData));
}


@override
int get hashCode => Object.hash(runtimeType,showLoading,loadingTransparent,popupType,error,dialogData);

@override
String toString() {
  return 'ModalEntity(showLoading: $showLoading, loadingTransparent: $loadingTransparent, popupType: $popupType, error: $error, dialogData: $dialogData)';
}


}

/// @nodoc
abstract mixin class _$ModalEntityCopyWith<$Res> implements $ModalEntityCopyWith<$Res> {
  factory _$ModalEntityCopyWith(_ModalEntity value, $Res Function(_ModalEntity) _then) = __$ModalEntityCopyWithImpl;
@override @useResult
$Res call({
 bool showLoading, bool loadingTransparent, PopupType popupType, ModalErrorEntity error, DialogData dialogData
});


@override $ModalErrorEntityCopyWith<$Res> get error;

}
/// @nodoc
class __$ModalEntityCopyWithImpl<$Res>
    implements _$ModalEntityCopyWith<$Res> {
  __$ModalEntityCopyWithImpl(this._self, this._then);

  final _ModalEntity _self;
  final $Res Function(_ModalEntity) _then;

/// Create a copy of ModalEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showLoading = null,Object? loadingTransparent = null,Object? popupType = null,Object? error = null,Object? dialogData = null,}) {
  return _then(_ModalEntity(
showLoading: null == showLoading ? _self.showLoading : showLoading // ignore: cast_nullable_to_non_nullable
as bool,loadingTransparent: null == loadingTransparent ? _self.loadingTransparent : loadingTransparent // ignore: cast_nullable_to_non_nullable
as bool,popupType: null == popupType ? _self.popupType : popupType // ignore: cast_nullable_to_non_nullable
as PopupType,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ModalErrorEntity,dialogData: null == dialogData ? _self.dialogData : dialogData // ignore: cast_nullable_to_non_nullable
as DialogData,
  ));
}

/// Create a copy of ModalEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalErrorEntityCopyWith<$Res> get error {
  
  return $ModalErrorEntityCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc
mixin _$ModalErrorEntity {

 int get code; String get message;
/// Create a copy of ModalErrorEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModalErrorEntityCopyWith<ModalErrorEntity> get copyWith => _$ModalErrorEntityCopyWithImpl<ModalErrorEntity>(this as ModalErrorEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModalErrorEntity&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ModalErrorEntity(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $ModalErrorEntityCopyWith<$Res>  {
  factory $ModalErrorEntityCopyWith(ModalErrorEntity value, $Res Function(ModalErrorEntity) _then) = _$ModalErrorEntityCopyWithImpl;
@useResult
$Res call({
 int code, String message
});




}
/// @nodoc
class _$ModalErrorEntityCopyWithImpl<$Res>
    implements $ModalErrorEntityCopyWith<$Res> {
  _$ModalErrorEntityCopyWithImpl(this._self, this._then);

  final ModalErrorEntity _self;
  final $Res Function(ModalErrorEntity) _then;

/// Create a copy of ModalErrorEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ModalErrorEntity].
extension ModalErrorEntityPatterns on ModalErrorEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModalErrorEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModalErrorEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModalErrorEntity value)  $default,){
final _that = this;
switch (_that) {
case _ModalErrorEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModalErrorEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ModalErrorEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int code,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModalErrorEntity() when $default != null:
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int code,  String message)  $default,) {final _that = this;
switch (_that) {
case _ModalErrorEntity():
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int code,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ModalErrorEntity() when $default != null:
return $default(_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ModalErrorEntity implements ModalErrorEntity {
  const _ModalErrorEntity({this.code = 0, this.message = ''});
  

@override@JsonKey() final  int code;
@override@JsonKey() final  String message;

/// Create a copy of ModalErrorEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModalErrorEntityCopyWith<_ModalErrorEntity> get copyWith => __$ModalErrorEntityCopyWithImpl<_ModalErrorEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModalErrorEntity&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'ModalErrorEntity(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ModalErrorEntityCopyWith<$Res> implements $ModalErrorEntityCopyWith<$Res> {
  factory _$ModalErrorEntityCopyWith(_ModalErrorEntity value, $Res Function(_ModalErrorEntity) _then) = __$ModalErrorEntityCopyWithImpl;
@override @useResult
$Res call({
 int code, String message
});




}
/// @nodoc
class __$ModalErrorEntityCopyWithImpl<$Res>
    implements _$ModalErrorEntityCopyWith<$Res> {
  __$ModalErrorEntityCopyWithImpl(this._self, this._then);

  final _ModalErrorEntity _self;
  final $Res Function(_ModalErrorEntity) _then;

/// Create a copy of ModalErrorEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(_ModalErrorEntity(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
