// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyCodeState {

 ModalEntity get modal; bool get verified;
/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCodeStateCopyWith<VerifyCodeState> get copyWith => _$VerifyCodeStateCopyWithImpl<VerifyCodeState>(this as VerifyCodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeState&&(identical(other.modal, modal) || other.modal == modal)&&(identical(other.verified, verified) || other.verified == verified));
}


@override
int get hashCode => Object.hash(runtimeType,modal,verified);

@override
String toString() {
  return 'VerifyCodeState(modal: $modal, verified: $verified)';
}


}

/// @nodoc
abstract mixin class $VerifyCodeStateCopyWith<$Res>  {
  factory $VerifyCodeStateCopyWith(VerifyCodeState value, $Res Function(VerifyCodeState) _then) = _$VerifyCodeStateCopyWithImpl;
@useResult
$Res call({
 ModalEntity modal, bool verified
});


$ModalEntityCopyWith<$Res> get modal;

}
/// @nodoc
class _$VerifyCodeStateCopyWithImpl<$Res>
    implements $VerifyCodeStateCopyWith<$Res> {
  _$VerifyCodeStateCopyWithImpl(this._self, this._then);

  final VerifyCodeState _self;
  final $Res Function(VerifyCodeState) _then;

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modal = null,Object? verified = null,}) {
  return _then(_self.copyWith(
modal: null == modal ? _self.modal : modal // ignore: cast_nullable_to_non_nullable
as ModalEntity,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalEntityCopyWith<$Res> get modal {
  
  return $ModalEntityCopyWith<$Res>(_self.modal, (value) {
    return _then(_self.copyWith(modal: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifyCodeState].
extension VerifyCodeStatePatterns on VerifyCodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyCodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyCodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyCodeState value)  $default,){
final _that = this;
switch (_that) {
case _VerifyCodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyCodeState value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyCodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ModalEntity modal,  bool verified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyCodeState() when $default != null:
return $default(_that.modal,_that.verified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ModalEntity modal,  bool verified)  $default,) {final _that = this;
switch (_that) {
case _VerifyCodeState():
return $default(_that.modal,_that.verified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ModalEntity modal,  bool verified)?  $default,) {final _that = this;
switch (_that) {
case _VerifyCodeState() when $default != null:
return $default(_that.modal,_that.verified);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyCodeState implements VerifyCodeState {
  const _VerifyCodeState({this.modal = const ModalEntity(), this.verified = false});
  

@override@JsonKey() final  ModalEntity modal;
@override@JsonKey() final  bool verified;

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyCodeStateCopyWith<_VerifyCodeState> get copyWith => __$VerifyCodeStateCopyWithImpl<_VerifyCodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyCodeState&&(identical(other.modal, modal) || other.modal == modal)&&(identical(other.verified, verified) || other.verified == verified));
}


@override
int get hashCode => Object.hash(runtimeType,modal,verified);

@override
String toString() {
  return 'VerifyCodeState(modal: $modal, verified: $verified)';
}


}

/// @nodoc
abstract mixin class _$VerifyCodeStateCopyWith<$Res> implements $VerifyCodeStateCopyWith<$Res> {
  factory _$VerifyCodeStateCopyWith(_VerifyCodeState value, $Res Function(_VerifyCodeState) _then) = __$VerifyCodeStateCopyWithImpl;
@override @useResult
$Res call({
 ModalEntity modal, bool verified
});


@override $ModalEntityCopyWith<$Res> get modal;

}
/// @nodoc
class __$VerifyCodeStateCopyWithImpl<$Res>
    implements _$VerifyCodeStateCopyWith<$Res> {
  __$VerifyCodeStateCopyWithImpl(this._self, this._then);

  final _VerifyCodeState _self;
  final $Res Function(_VerifyCodeState) _then;

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modal = null,Object? verified = null,}) {
  return _then(_VerifyCodeState(
modal: null == modal ? _self.modal : modal // ignore: cast_nullable_to_non_nullable
as ModalEntity,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VerifyCodeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModalEntityCopyWith<$Res> get modal {
  
  return $ModalEntityCopyWith<$Res>(_self.modal, (value) {
    return _then(_self.copyWith(modal: value));
  });
}
}

// dart format on
