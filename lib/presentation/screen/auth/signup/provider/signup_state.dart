import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignupState with _$SignupState {
  const factory SignupState({
    @Default(ModalEntity()) ModalEntity modal,
    @Default(AccountEntity()) AccountEntity account,
  }) = _SignupState;
}
