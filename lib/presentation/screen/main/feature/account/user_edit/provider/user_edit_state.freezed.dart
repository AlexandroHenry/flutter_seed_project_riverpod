// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEditState {

 String get displayName; bool get processing; String get errorMessage; bool get saved;
/// Create a copy of UserEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEditStateCopyWith<UserEditState> get copyWith => _$UserEditStateCopyWithImpl<UserEditState>(this as UserEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEditState&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.processing, processing) || other.processing == processing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,processing,errorMessage,saved);

@override
String toString() {
  return 'UserEditState(displayName: $displayName, processing: $processing, errorMessage: $errorMessage, saved: $saved)';
}


}

/// @nodoc
abstract mixin class $UserEditStateCopyWith<$Res>  {
  factory $UserEditStateCopyWith(UserEditState value, $Res Function(UserEditState) _then) = _$UserEditStateCopyWithImpl;
@useResult
$Res call({
 String displayName, bool processing, String errorMessage, bool saved
});




}
/// @nodoc
class _$UserEditStateCopyWithImpl<$Res>
    implements $UserEditStateCopyWith<$Res> {
  _$UserEditStateCopyWithImpl(this._self, this._then);

  final UserEditState _self;
  final $Res Function(UserEditState) _then;

/// Create a copy of UserEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? processing = null,Object? errorMessage = null,Object? saved = null,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,processing: null == processing ? _self.processing : processing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEditState].
extension UserEditStatePatterns on UserEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEditState value)  $default,){
final _that = this;
switch (_that) {
case _UserEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEditState value)?  $default,){
final _that = this;
switch (_that) {
case _UserEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String displayName,  bool processing,  String errorMessage,  bool saved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEditState() when $default != null:
return $default(_that.displayName,_that.processing,_that.errorMessage,_that.saved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String displayName,  bool processing,  String errorMessage,  bool saved)  $default,) {final _that = this;
switch (_that) {
case _UserEditState():
return $default(_that.displayName,_that.processing,_that.errorMessage,_that.saved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String displayName,  bool processing,  String errorMessage,  bool saved)?  $default,) {final _that = this;
switch (_that) {
case _UserEditState() when $default != null:
return $default(_that.displayName,_that.processing,_that.errorMessage,_that.saved);case _:
  return null;

}
}

}

/// @nodoc


class _UserEditState implements UserEditState {
  const _UserEditState({this.displayName = '', this.processing = false, this.errorMessage = '', this.saved = false});
  

@override@JsonKey() final  String displayName;
@override@JsonKey() final  bool processing;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool saved;

/// Create a copy of UserEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEditStateCopyWith<_UserEditState> get copyWith => __$UserEditStateCopyWithImpl<_UserEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEditState&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.processing, processing) || other.processing == processing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,displayName,processing,errorMessage,saved);

@override
String toString() {
  return 'UserEditState(displayName: $displayName, processing: $processing, errorMessage: $errorMessage, saved: $saved)';
}


}

/// @nodoc
abstract mixin class _$UserEditStateCopyWith<$Res> implements $UserEditStateCopyWith<$Res> {
  factory _$UserEditStateCopyWith(_UserEditState value, $Res Function(_UserEditState) _then) = __$UserEditStateCopyWithImpl;
@override @useResult
$Res call({
 String displayName, bool processing, String errorMessage, bool saved
});




}
/// @nodoc
class __$UserEditStateCopyWithImpl<$Res>
    implements _$UserEditStateCopyWith<$Res> {
  __$UserEditStateCopyWithImpl(this._self, this._then);

  final _UserEditState _self;
  final $Res Function(_UserEditState) _then;

/// Create a copy of UserEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? processing = null,Object? errorMessage = null,Object? saved = null,}) {
  return _then(_UserEditState(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,processing: null == processing ? _self.processing : processing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
