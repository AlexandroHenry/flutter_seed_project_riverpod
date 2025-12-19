import 'package:project_crew/domain/entity/modal/modal_entity.dart';

abstract class VerifyCodeScreenEvent {
  const VerifyCodeScreenEvent();
}

class VerifyCodeScreenLoad extends VerifyCodeScreenEvent {
  final bool reload;
  const VerifyCodeScreenLoad({this.reload = false});
}

class VerifyCodeScreenSubmit extends VerifyCodeScreenEvent {
  final String email;
  final String code;
  const VerifyCodeScreenSubmit({required this.email, required this.code});
}

class VerifyCodeScreenModal extends VerifyCodeScreenEvent {
  final ModalEntity modal;
  const VerifyCodeScreenModal({this.modal = const ModalEntity()});
}


