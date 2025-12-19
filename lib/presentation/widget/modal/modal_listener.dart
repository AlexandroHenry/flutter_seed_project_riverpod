import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_crew/core/enum/popup_type.dart';
import 'package:project_crew/core/extension/easy_localization_x.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/domain/entity/modal/modal_entity.dart';
import 'package:project_crew/presentation/widget/modal/modal_provider.dart';

class ModalListener extends ConsumerStatefulWidget {
  const ModalListener({
    super.key,
    this.showLoading = false,
    this.loadingTransparent = false,
    this.popupType = PopupType.oneButton,
    this.error = const ModalErrorEntity(),
    this.errorDialogData = const DialogData(),
    required this.child,
  });

  final bool showLoading;
  final bool loadingTransparent;
  final PopupType popupType;
  final ModalErrorEntity error;
  final DialogData errorDialogData;
  final Widget child;

  @override
  ConsumerState<ModalListener> createState() => _ModalListenerState();
}

class _ModalListenerState extends ConsumerState<ModalListener> {

  @override
  void didUpdateWidget(covariant ModalListener oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.showLoading != widget.showLoading) {
      _showLoadingDialog(context, widget.showLoading,
        loadingTransparent: widget.loadingTransparent,
      );
    }

    if (oldWidget.error.hashCode != widget.error.hashCode) {
      _showErrorDialog(context, widget.errorDialogData, widget.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ModalEntity>(modalProvider, (prev, state) {
      if (prev?.showLoading != state.showLoading ||
          prev?.loadingTransparent != state.loadingTransparent) {
        _showLoadingDialog(
          context,
          state.showLoading,
          loadingTransparent: state.loadingTransparent,
        );
      }
      if ((prev?.error.hashCode ?? 0) != state.error.hashCode) {
        _showErrorDialog(context, state.dialogData, state.error);
      }
    });
    return widget.child;
  }

  Future<void> _showLoadingDialog(
    BuildContext context, bool showLoading,
    { bool? loadingTransparent = false, }
  ) async {
    await Future.delayed(Duration.zero);
    if (context.mounted == false) return;

    if (showLoading == true) {
      DialogUtil().showLoading(
        context: context.tryValidContext,
        isTransparent: loadingTransparent,
      );
    } else {
      DialogUtil().hideLoading(
        context: context.tryValidContext,
      );
    }
  }

  Future<void> _showErrorDialog(
    BuildContext context, DialogData dialogData, ModalErrorEntity error,
  ) async {
    await Future.delayed(Duration.zero);
    if (context.mounted == false) return;

    /// 에러 코드 300 이상이나 -1 에러일때 팝업 됨.
    var errorCode = error.code;
    if ((errorCode >= 300 && errorCode != 304) || errorCode == -1) {
      if (widget.popupType == PopupType.oneButton) {
        DialogUtil().showConfirmDialog(
          context: context.tryValidContext,
          canUserClose: dialogData.canUserClose ?? true,
          data: DialogData(
            title: dialogData.title.isEmpty
                ? 'dialog.notice'.tr2() : dialogData.title.tr2(),
            contents: dialogData.contents.isEmpty
                ? error.message : dialogData.contents.tr2(),
            confirmText: dialogData.confirmText.isEmpty
                ? 'dialog.confirm'.tr2() : dialogData.confirmText.tr2(),
            onConfirm: () => dialogData.onConfirm?.call(),
            onUserClose: () => dialogData.onUserClose?.call(),
            data: dialogData.data,
          ),
          useRootNavigator: (errorCode == 401 || errorCode == 403),
        );
      } else {
        DialogUtil().showNormalDialog(
          context: context.tryValidContext,
          canUserClose: dialogData.canUserClose ?? true,
          data: DialogData(
            title: dialogData.title.isEmpty
                ? 'dialog.notice'.tr2() : dialogData.title.tr2(),
            contents: dialogData.contents.isEmpty
                ? error.message : dialogData.contents.tr2(),
            confirmText: dialogData.confirmText.isEmpty
                ? 'dialog.confirm'.tr2() : dialogData.confirmText.tr2(),
            cancelText: dialogData.cancelText.isEmpty
                ? 'dialog.cancel'.tr2() : dialogData.cancelText.tr2(),
            onConfirm: () => dialogData.onConfirm?.call(),
            onCancel: () => dialogData.onCancel?.call(),
            onUserClose: () => dialogData.onUserClose?.call(),
            data: dialogData.data,
          ),
          useRootNavigator: (errorCode == 401 || errorCode == 403),
        );
      }
    }
  }
}

extension ScaffoldContextX on BuildContext {

  BuildContext get tryValidContext {
    try {
      if (Scaffold.of(this).mounted == true) {
        return Scaffold.of(this).context;
      } else {
        return this;
      }
    } catch (e) {
      return this;
    }
  }
}

