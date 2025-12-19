import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';
import 'package:project_crew/domain/params/auth/reset/verify_reset_code_params.dart';
import 'package:project_crew/domain/params/auth/signup/verify_signup_code_params.dart';
import 'package:project_crew/domain/usecase/auth/signup/verify_signup_code_usecase.dart';
import 'package:project_crew/domain/usecase/auth/reset/verify_reset_code_usecase.dart';
import 'verify_code_state.dart';

part 'verify_code_provider.g.dart';

@riverpod
class VerifyCode extends _$VerifyCode {
  bool _forSignup = false;

  @override
  VerifyCodeState build() {
    return const VerifyCodeState();
  }

  Future<void> load({bool reload = false, bool forSignup = false}) async {
    _forSignup = forSignup;
    if (reload) {
      state = const VerifyCodeState();
    }
    state = state.copyWith(
      modal: const ModalEntity(showLoading: false),
      verified: false,
    );
  }

  Future<void> submit({required String email, required String code}) async {
    state = state.copyWith(modal: const ModalEntity(showLoading: true));
    
    final result = _forSignup
        ? await GetIt.instance<VerifySignupCodeUseCase>()(
            VerifySignupCodeParams(email: email, code: code),
          )
        : await GetIt.instance<VerifyResetCodeUseCase>()(
            VerifyResetCodeParams(email: email, code: code),
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
          verified: false,
        );
      },
      (_) {
        state = state.copyWith(
          modal: const ModalEntity(showLoading: false),
          verified: true,
        );
      },
    );
  }

  void _clearModal() {
    state = state.copyWith(modal: const ModalEntity());
  }
}
