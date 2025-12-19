import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_crew/core/config/theme.dart';
import 'package:project_crew/core/extension/context_extension.dart';
import 'package:project_crew/core/util/figma_text_styles.dart';
import 'package:project_crew/presentation/widget/base/base_button.dart';

class OneButtonDialog extends StatelessWidget {
  const OneButtonDialog({
    super.key,
    required this.title,
    required this.contents,
    required this.confirmText,
    required this.canUserClose,
    this.onConfirm,
    this.onUserClose,
  });

  final String title;
  final String contents;
  final String confirmText;
  final bool canUserClose;

  final VoidCallback? onConfirm;
  final VoidCallback? onUserClose;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (canUserClose == true) {
            onUserClose?.call();
            Navigator.pop(context);
          }
        },
        // background
        child: Material(
          // color: context.appColor.dim,  // dim color
          color: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: _buildContents(context),
          ) // contents
        ),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width > 320 ? 320.0 : null,
          margin: MediaQuery.sizeOf(context).width > 320 ? null
              : const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: context.appColor.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30.0,),
                    title.isNotEmpty ? Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        title,
                        style: FigmaTextStyles().heading16Sb.copyWith(
                          color: context.appColor.mainBlack,
                        ),
                      ),
                    ) : Container(),
                    title.isNotEmpty ? const SizedBox(height: 8.0,) : Container(),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
                        contents,
                        textAlign: TextAlign.center,
                        style: FigmaTextStyles().body14Rg.copyWith(
                          color: context.appColor.darkGray,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: context.appColor.borderLightGray,
                      width: 1.0,
                    ),
                  ),
                  color: context.appColor.white,
                ),
                child: BaseButton(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  text: confirmText,
                  textStyle: FigmaTextStyles().body14Sb.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                  backgroundColor: context.appColor.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  onTap: () {
                    onConfirm?.call();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

