import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_edit_state.freezed.dart';

@freezed
abstract class UserEditState with _$UserEditState {
  const factory UserEditState({
    @Default('') String displayName,
    @Default(false) bool processing,
    @Default('') String errorMessage,
    @Default(false) bool saved,
  }) = _UserEditState;
}
