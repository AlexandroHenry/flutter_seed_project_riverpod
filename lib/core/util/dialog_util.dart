import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_crew/core/config/theme.dart';
import 'package:project_crew/core/helper/context_helper.dart';
import 'package:project_crew/presentation/widget/dialog/one_button_dialog.dart';
import 'package:project_crew/presentation/widget/dialog/two_button_dialog.dart';

class DialogUtil {

  static final DialogUtil _instance = DialogUtil._internal();
  factory DialogUtil() {
    return _instance;
  }

  DialogUtil._internal();

  bool isShowLoading = false;

  Future<T?> showNormalDialog<T>({
    required BuildContext context,
    required DialogData data,
    bool canUserClose = true,
    bool useRootNavigator = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: canUserClose,
      // barrierColor: Colors.transparent,
      barrierColor: context.appColor.dim,
      /// 꼭!!! 올바른 백버튼 처리를 위해서는 useRootNavigator를 false로 처리.
      /// true로 할 경우 root context를 참조하기에 백버튼을 누르면 앱 종료됨.
      useRootNavigator: useRootNavigator,
      useSafeArea: false,
      builder: (BuildContext buildContext) => PopScope(
        canPop: canUserClose,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          if (canUserClose) {
            data.onUserClose?.call();
          }
        },
        child: TwoButtonDialog(
          title: data.title,
          contents: data.contents,
          confirmText: data.confirmText,
          cancelText: data.cancelText,
          onConfirm: data.onConfirm,
          onCancel: data.onCancel,
          onUserClose: data.onUserClose,
          canUserClose: canUserClose,
        ),
      ),
    );
  }

  Future<T?> showConfirmDialog<T>({
    required BuildContext context,
    required DialogData data,
    bool canUserClose = true,
    bool useRootNavigator = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: canUserClose,
      // barrierColor: Colors.transparent,
      barrierColor: context.appColor.dim,
      useRootNavigator: useRootNavigator,
      useSafeArea: false,
      builder: (BuildContext buildContext) => PopScope(
        canPop: canUserClose,
        onPopInvokedWithResult: (didPop, result) async {
          if (canUserClose) {
            data.onUserClose?.call();
          }
        },
        child: OneButtonDialog(
          title: data.title,
          contents: data.contents,
          confirmText: data.confirmText,
          onConfirm: data.onConfirm,
          canUserClose: canUserClose,
        ),
      ),
    );
  }

  Future<T?> showLoading<T>({
    BuildContext? context,
    bool? isTransparent = false,
  }) {
    if (isShowLoading == true) return Future.value(null);
    isShowLoading = true;

    return showDialog(
      context: context ?? ContextHelper.currentContext!,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      useRootNavigator: true,
      builder: (BuildContext buildContext) => PopScope(
        canPop: false,
        child: Center(
          child: isTransparent == true
            ? SizedBox()
            /// todo : 로딩 창이 뜨는지 테스트용, 릴리즈 모드일때는 공용 로딩 이미지로 변경
            : kReleaseMode ? Lottie.asset(
                'assets/lottie/ainoon_loading.json',
                repeat: true,
                width: 48.0,
                height: 48.0,
                fit: BoxFit.cover,
              ) : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<void> hideLoading({ BuildContext? context }) async {
    if (isShowLoading == false) return;
    isShowLoading = false;

    Navigator.of(
      context ?? ContextHelper.currentContext!, rootNavigator: true,
    ).pop();
  }
}

class DialogData<T> with EquatableMixin {
  final String title;
  final String contents;
  final String confirmText;
  final String cancelText;
  final bool? canUserClose;
  final VoidCallback? onUserClose;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final T? data;

  const DialogData({
    this.title = '',
    this.contents = '',
    this.confirmText = '',
    this.cancelText = '',
    this.canUserClose,
    this.onUserClose,
    this.onConfirm,
    this.onCancel,
    this.data,
  });

  @override
  List<Object?> get props =>
    [
      title, contents, confirmText, cancelText,
      onConfirm, onCancel, canUserClose, onUserClose, data,
    ];
}