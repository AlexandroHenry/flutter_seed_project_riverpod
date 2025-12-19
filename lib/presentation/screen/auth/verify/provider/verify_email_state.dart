import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_state.freezed.dart';

@freezed
abstract class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState({
    @Default(false) bool sending,
    @Default(false) bool checking,
    @Default(false) bool verified,
    @Default('') String errorMessage,
  }) = _VerifyEmailState;
}
