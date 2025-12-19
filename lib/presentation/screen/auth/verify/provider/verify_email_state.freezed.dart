// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyEmailState {

 bool get sending; bool get checking; bool get verified; String get errorMessage;
/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailStateCopyWith<VerifyEmailState> get copyWith => _$VerifyEmailStateCopyWithImpl<VerifyEmailState>(this as VerifyEmailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailState&&(identical(other.sending, sending) || other.sending == sending)&&(identical(other.checking, checking) || other.checking == checking)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,sending,checking,verified,errorMessage);

@override
String toString() {
  return 'VerifyEmailState(sending: $sending, checking: $checking, verified: $verified, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailStateCopyWith<$Res>  {
  factory $VerifyEmailStateCopyWith(VerifyEmailState value, $Res Function(VerifyEmailState) _then) = _$VerifyEmailStateCopyWithImpl;
@useResult
$Res call({
 bool sending, bool checking, bool verified, String errorMessage
});




}
/// @nodoc
class _$VerifyEmailStateCopyWithImpl<$Res>
    implements $VerifyEmailStateCopyWith<$Res> {
  _$VerifyEmailStateCopyWithImpl(this._self, this._then);

  final VerifyEmailState _self;
  final $Res Function(VerifyEmailState) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sending = null,Object? checking = null,Object? verified = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
sending: null == sending ? _self.sending : sending // ignore: cast_nullable_to_non_nullable
as bool,checking: null == checking ? _self.checking : checking // ignore: cast_nullable_to_non_nullable
as bool,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyEmailState].
extension VerifyEmailStatePatterns on VerifyEmailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyEmailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyEmailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyEmailState value)  $default,){
final _that = this;
switch (_that) {
case _VerifyEmailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyEmailState value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyEmailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool sending,  bool checking,  bool verified,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyEmailState() when $default != null:
return $default(_that.sending,_that.checking,_that.verified,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool sending,  bool checking,  bool verified,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VerifyEmailState():
return $default(_that.sending,_that.checking,_that.verified,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool sending,  bool checking,  bool verified,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VerifyEmailState() when $default != null:
return $default(_that.sending,_that.checking,_that.verified,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyEmailState implements VerifyEmailState {
  const _VerifyEmailState({this.sending = false, this.checking = false, this.verified = false, this.errorMessage = ''});
  

@override@JsonKey() final  bool sending;
@override@JsonKey() final  bool checking;
@override@JsonKey() final  bool verified;
@override@JsonKey() final  String errorMessage;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyEmailStateCopyWith<_VerifyEmailState> get copyWith => __$VerifyEmailStateCopyWithImpl<_VerifyEmailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyEmailState&&(identical(other.sending, sending) || other.sending == sending)&&(identical(other.checking, checking) || other.checking == checking)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,sending,checking,verified,errorMessage);

@override
String toString() {
  return 'VerifyEmailState(sending: $sending, checking: $checking, verified: $verified, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VerifyEmailStateCopyWith<$Res> implements $VerifyEmailStateCopyWith<$Res> {
  factory _$VerifyEmailStateCopyWith(_VerifyEmailState value, $Res Function(_VerifyEmailState) _then) = __$VerifyEmailStateCopyWithImpl;
@override @useResult
$Res call({
 bool sending, bool checking, bool verified, String errorMessage
});




}
/// @nodoc
class __$VerifyEmailStateCopyWithImpl<$Res>
    implements _$VerifyEmailStateCopyWith<$Res> {
  __$VerifyEmailStateCopyWithImpl(this._self, this._then);

  final _VerifyEmailState _self;
  final $Res Function(_VerifyEmailState) _then;

/// Create a copy of VerifyEmailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sending = null,Object? checking = null,Object? verified = null,Object? errorMessage = null,}) {
  return _then(_VerifyEmailState(
sending: null == sending ? _self.sending : sending // ignore: cast_nullable_to_non_nullable
as bool,checking: null == checking ? _self.checking : checking // ignore: cast_nullable_to_non_nullable
as bool,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
