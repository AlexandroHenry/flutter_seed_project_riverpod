import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/core/enum/popup_type.dart';
import 'package:project_crew/core/util/dialog_util.dart';

part 'modal_entity.freezed.dart';

@freezed
abstract class ModalEntity with _$ModalEntity {
  const factory ModalEntity({
    @Default(false) bool showLoading,
    @Default(false) bool loadingTransparent,
    @Default(PopupType.oneButton) PopupType popupType,
    @Default(ModalErrorEntity()) ModalErrorEntity error,
    @Default(DialogData()) DialogData dialogData,
  }) = _ModalEntity;
}

@freezed
abstract class ModalErrorEntity with _$ModalErrorEntity {
  const factory ModalErrorEntity({
    @Default(0) int code,
    @Default('') String message,
  }) = _ModalErrorEntity;
}