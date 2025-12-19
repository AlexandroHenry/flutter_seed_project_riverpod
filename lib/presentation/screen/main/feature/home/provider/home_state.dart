import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(ModalEntity()) ModalEntity modal,
  }) = _HomeState;
}

