import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_state.freezed.dart';

@freezed
abstract class UserDetailState with _$UserDetailState {
  const factory UserDetailState({
    @Default(false) bool processing,
    @Default('') String errorMessage,
    @Default(false) bool loggedOut,
    @Default('') String displayName,
  }) = _UserDetailState;
}

