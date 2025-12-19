import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/domain/entity/auth/account/account_entity.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';
import 'package:project_crew/domain/params/auth/signup/sign_up_params.dart';
import 'package:project_crew/domain/usecase/auth/signup/sign_up_usecase.dart';
import 'package:project_crew/presentation/screen/auth/signup/provider/signup_state.dart';

part 'signup_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  @override
  SignupState build() {
    return const SignupState();
  }

  Future<void> load({bool reload = false}) async {
    if (reload) {
      state = const SignupState();
    }
    state = state.copyWith(modal: const ModalEntity(showLoading: false));
  }

  Future<void> signUp({required String email, required String password}) async {
    state = state.copyWith(modal: const ModalEntity(showLoading: true));

    final useCase = GetIt.instance<SignUpUseCase>();
    final result = await useCase(SignUpParams(email: email, password: password));

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
        );
      },
      (right) {
        // Signal UI to navigate to email verification flow
        state = state.copyWith(
          modal: const ModalEntity(showLoading: false),
          account: const AccountEntity(
            accessToken: '__VERIFY_EMAIL__',
            refreshToken: '',
          ),
        );
      },
    );
  }

  void _clearModal() {
    state = state.copyWith(modal: const ModalEntity());
  }
}
