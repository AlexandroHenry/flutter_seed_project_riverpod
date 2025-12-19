import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';

part 'modal_provider.g.dart';

@Riverpod(keepAlive: true)
class Modal extends _$Modal {
  @override
  ModalEntity build() {
    return const ModalEntity();
  }

  void setLoading(bool show, {bool transparent = false}) {
    state = state.copyWith(
      showLoading: show,
      loadingTransparent: transparent,
    );
  }

  void showError({
    required ModalErrorEntity error,
    DialogData dialogData = const DialogData(),
  }) {
    state = state.copyWith(
      error: error,
      dialogData: dialogData,
    );
  }

  void clearError() {
    state = state.copyWith(
      error: const ModalErrorEntity(),
      dialogData: const DialogData(),
    );
  }

  void setModal(ModalEntity modal) {
    state = modal;
  }
}

