import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';
import 'package:project_crew/domain/params/auth/reset/request_reset_code_params.dart';
import 'package:project_crew/domain/usecase/auth/reset/request_reset_code_usecase.dart';
import 'package:project_crew/presentation/screen/auth/forgot/provider/forgot_password_state.dart';

part 'forgot_password_provider.g.dart';

@Riverpod(keepAlive: true)
class ForgotPassword extends _$ForgotPassword {
  @override
  ForgotPasswordState build() {
    return const ForgotPasswordState();
  }

  Future<void> load({bool reload = false}) async {
    if (reload) {
      state = const ForgotPasswordState();
    }
    state = state.copyWith(modal: const ModalEntity(showLoading: false), sent: false);
  }

  Future<void> submit({required String email}) async {
    final loadState = state;
    state = loadState.copyWith(modal: const ModalEntity(showLoading: true));
    final useCase = GetIt.instance<RequestResetCodeUseCase>();
    final result = await useCase(RequestResetCodeParams(email: email));
    await result.fold(
      (left) async {
        state = loadState.copyWith(
          modal: ModalEntity(
            showLoading: false,
            error: ModalErrorEntity(code: left.code, message: left.message),
            dialogData: DialogData(
              onConfirm: () => _clearModal(),
              onCancel: () => _clearModal(),
              onUserClose: () => _clearModal(),
            ),
          ),
        );
      },
      (_) async {
        state = loadState.copyWith(
          modal: const ModalEntity(showLoading: false),
          sent: true,
        );
      },
    );
  }

  void _clearModal() {
    state = state.copyWith(modal: const ModalEntity());
  }
}

