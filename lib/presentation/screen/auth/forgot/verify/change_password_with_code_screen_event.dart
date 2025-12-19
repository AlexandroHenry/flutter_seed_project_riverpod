import 'package:project_crew/domain/entity/modal/modal_entity.dart';

abstract class ChangePasswordWithCodeScreenEvent {
  const ChangePasswordWithCodeScreenEvent();
}

class ChangePasswordWithCodeScreenLoad
    extends ChangePasswordWithCodeScreenEvent {
  final bool reload;
  const ChangePasswordWithCodeScreenLoad({this.reload = false});
}

class ChangePasswordWithCodeScreenSubmit
    extends ChangePasswordWithCodeScreenEvent {
  final String email;
  final String code;
  final String newPassword;
  const ChangePasswordWithCodeScreenSubmit({
    required this.email,
    required this.code,
    required this.newPassword,
  });
}

class ChangePasswordWithCodeScreenModal
    extends ChangePasswordWithCodeScreenEvent {
  final ModalEntity modal;
  const ChangePasswordWithCodeScreenModal({this.modal = const ModalEntity()});
}


