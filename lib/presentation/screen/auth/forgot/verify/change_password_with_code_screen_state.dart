import 'package:project_crew/domain/entity/modal/modal_entity.dart';

abstract class ChangePasswordWithCodeScreenState {
  const ChangePasswordWithCodeScreenState({
    required this.modal,
    required this.completed,
  });

  final ModalEntity modal;
  final bool completed;
}

class ChangePasswordWithCodeScreenInit
    extends ChangePasswordWithCodeScreenState {
  const ChangePasswordWithCodeScreenInit()
      : super(modal: const ModalEntity(), completed: false);
}

class ChangePasswordWithCodeScreenLoadState
    extends ChangePasswordWithCodeScreenState {
  const ChangePasswordWithCodeScreenLoadState({
    super.modal = const ModalEntity(),
    super.completed = false,
  });

  ChangePasswordWithCodeScreenLoadState copyWith({
    ModalEntity? modal,
    bool? completed,
  }) {
    return ChangePasswordWithCodeScreenLoadState(
      modal: modal ?? this.modal,
      completed: completed ?? this.completed,
    );
  }
}

class ChangePasswordWithCodeScreenError
    extends ChangePasswordWithCodeScreenState {
  const ChangePasswordWithCodeScreenError()
      : super(modal: const ModalEntity(), completed: false);
}


