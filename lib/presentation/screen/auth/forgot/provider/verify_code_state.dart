import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';

part 'verify_code_state.freezed.dart';

@freezed
abstract class VerifyCodeState with _$VerifyCodeState {
  const factory VerifyCodeState({
    @Default(ModalEntity()) ModalEntity modal,
    @Default(false) bool verified,
  }) = _VerifyCodeState;
}

