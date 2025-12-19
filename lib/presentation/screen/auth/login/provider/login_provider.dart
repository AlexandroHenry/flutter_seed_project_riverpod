import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';
import 'package:project_crew/domain/params/auth/login/login_params.dart';
import 'package:project_crew/domain/usecase/auth/login/login_usecase.dart';
import 'package:project_crew/presentation/screen/auth/login/provider/login_state.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return const LoginState();
  }

  Future<void> load({bool reload = false}) async {
    if (reload) {
      state = const LoginState();
    }
    state = state.copyWith(modal: const ModalEntity(showLoading: false));
  }

  Future<void> login({required String id, required String password}) async {
    state = state.copyWith(modal: const ModalEntity(showLoading: true));
    
    final loginUseCase = GetIt.instance<LoginUseCase>();
    final result = await loginUseCase(LoginParams(id: id, password: password));
    
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
        state = state.copyWith(
          modal: const ModalEntity(showLoading: false),
          account: right,
        );
      },
    );
  }

  void _clearModal() {
    state = state.copyWith(modal: const ModalEntity());
  }
}
