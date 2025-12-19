import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(ModalEntity()) ModalEntity modal,
    @Default(AccountEntity()) AccountEntity account,
  }) = _LoginState;
}
