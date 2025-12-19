import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';

part 'change_password_state.freezed.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(ModalEntity()) ModalEntity modal,
    @Default(false) bool completed,
  }) = _ChangePasswordState;
}
