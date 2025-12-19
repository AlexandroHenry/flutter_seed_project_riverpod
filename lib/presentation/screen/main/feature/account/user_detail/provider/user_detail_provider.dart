import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_crew/domain/usecase/auth/logout/logout_usecase.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_detail/provider/user_detail_state.dart';

part 'user_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class UserDetail extends _$UserDetail {
  @override
  UserDetailState build() {
    return const UserDetailState();
  }

  Future<void> load({bool reload = false}) async {
    if (reload == true) {
      state = const UserDetailState();
    }
    try {
      await FirebaseAuth.instance.currentUser?.reload();
    } catch (_) {
      // ignore
    }
    final name = FirebaseAuth.instance.currentUser?.displayName ?? '';
    state = state.copyWith(processing: false, displayName: name);
  }

  Future<void> logout() async {
    state = state.copyWith(processing: true, errorMessage: '');
    try {
      final useCase = GetIt.instance<LogoutUseCase>();
      final result = await useCase(null);
      await result.fold(
        (left) async {
          state = state.copyWith(processing: false, errorMessage: left.message);
        },
        (right) async {
          state = state.copyWith(processing: false, loggedOut: true);
        },
      );
    } catch (_) {
      state = state.copyWith(
        processing: false,
        errorMessage: '로그아웃 중 오류가 발생했습니다.',
      );
    }
  }

  void setError(String message) {
    state = state.copyWith(errorMessage: message);
  }
}

