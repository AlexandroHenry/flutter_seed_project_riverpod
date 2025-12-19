import 'package:project_crew/domain/entity/modal/modal_entity.dart';

abstract class VerifyCodeScreenState {
  const VerifyCodeScreenState({
    required this.modal,
    required this.verified,
  });

  final ModalEntity modal;
  final bool verified;
}

class VerifyCodeScreenInit extends VerifyCodeScreenState {
  const VerifyCodeScreenInit()
      : super(modal: const ModalEntity(), verified: false);
}

class VerifyCodeScreenLoadState extends VerifyCodeScreenState {
  const VerifyCodeScreenLoadState({
    super.modal = const ModalEntity(),
    super.verified = false,
  });

  VerifyCodeScreenLoadState copyWith({
    ModalEntity? modal,
    bool? verified,
  }) {
    return VerifyCodeScreenLoadState(
      modal: modal ?? this.modal,
      verified: verified ?? this.verified,
    );
  }
}

class VerifyCodeScreenError extends VerifyCodeScreenState {
  const VerifyCodeScreenError()
      : super(modal: const ModalEntity(), verified: false);
}


