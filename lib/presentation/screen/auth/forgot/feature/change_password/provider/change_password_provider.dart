import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';
import 'package:project_crew/domain/params/auth/reset/update_password_with_code_params.dart';
import 'package:project_crew/domain/usecase/auth/reset/update_password_with_code_usecase.dart';
import 'change_password_state.dart';

part 'change_password_provider.g.dart';

@riverpod
class ChangePassword extends _$ChangePassword {
  @override
  ChangePasswordState build() {
    return const ChangePasswordState();
  }

  Future<void> load({bool reload = false}) async {
    if (reload) {
      state = const ChangePasswordState();
    }
    state = state.copyWith(
      modal: const ModalEntity(showLoading: false),
      completed: false,
    );
  }

  Future<void> submit({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    state = state.copyWith(modal: const ModalEntity(showLoading: true));
    
    final useCase = GetIt.instance<UpdatePasswordWithCodeUseCase>();
    final result = await useCase(
      UpdatePasswordWithCodeParams(
        email: email,
        code: code,
        newPassword: newPassword,
      ),
    );
    
    result.fold(
      (left) {
        state = state.copyWith(
          modal: ModalEntity(
            showLoading: false,
            error: ModalErrorEntity(code: left.code, message: left.message),
            dialogData: DialogData(
              onConfirm: _clearModal,
              onCancel: _clearModal,
              onUserClose: _clearModal,
            ),
          ),
          completed: false,
        );
      },
      (_) {
        state = state.copyWith(
          modal: const ModalEntity(showLoading: false),
          completed: true,
        );
      },
    );
  }

  void _clearModal() {
    state = state.copyWith(modal: const ModalEntity());
  }
}
