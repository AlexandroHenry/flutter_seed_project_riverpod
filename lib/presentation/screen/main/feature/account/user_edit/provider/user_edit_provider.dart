import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_edit/provider/user_edit_state.dart';

part 'user_edit_provider.g.dart';

@Riverpod(keepAlive: true)
class UserEdit extends _$UserEdit {
  @override
  UserEditState build() {
    _loadUserData();
    return const UserEditState();
  }

  void _loadUserData() {
    final user = FirebaseAuth.instance.currentUser;
    state = state.copyWith(
      displayName: user?.displayName ?? '',
    );
  }

  void updateDisplayName(String value) {
    state = state.copyWith(displayName: value);
  }

  Future<void> save() async {
    final nickname = state.displayName.trim();
    
    if (nickname.isEmpty) {
      state = state.copyWith(
        errorMessage: '닉네임을 입력해 주세요.',
      );
      return;
    }

    state = state.copyWith(processing: true, errorMessage: '');

    try {
      final user = FirebaseAuth.instance.currentUser;
      
      if (user == null) {
        state = state.copyWith(
          processing: false,
          errorMessage: '로그인이 만료되었습니다. 다시 로그인해 주세요.',
        );
        return;
      }

      await user.updateDisplayName(nickname);
      await user.reload();

      state = state.copyWith(
        processing: false,
        saved: true,
      );
    } on FirebaseAuthException catch (e) {
      String message = '저장에 실패했습니다.';
      if (e.code == 'network-request-failed') {
        message = '네트워크 오류가 발생했습니다. 연결을 확인해 주세요.';
      }
      state = state.copyWith(
        processing: false,
        errorMessage: message,
      );
    } catch (_) {
      state = state.copyWith(
        processing: false,
        errorMessage: '저장 중 오류가 발생했습니다.',
      );
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: '');
  }
}
