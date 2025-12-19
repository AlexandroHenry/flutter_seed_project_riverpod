import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';

part 'forgot_password_state.freezed.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(ModalEntity()) ModalEntity modal,
    @Default(false) bool sent,
  }) = _ForgotPasswordState;
}

