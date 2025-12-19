import 'package:flutter/material.dart';

enum ButtonState { enabled, disabled, }

class BaseButton extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final ButtonState? state;
  final VoidCallback? onTap;

  const BaseButton({
    super.key,
    required this.text,
    required this.textStyle,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.textAlign = TextAlign.center,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.state = ButtonState.enabled,
    this.onTap
  });

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.sizeOf(context).width,
      height: widget.height ?? 54.0,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.state == ButtonState.enabled
            ? widget.backgroundColor
            : widget.disabledBackgroundColor ?? widget.backgroundColor?.withValues(alpha: 0.5),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12.0),
        border: widget.border,
        boxShadow: widget.boxShadow,
      ),
      child: widget.state == ButtonState.enabled ? Material(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8.0),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (widget.state != null && widget.state == ButtonState.enabled) {
              widget.onTap?.call();
            }
          },
          child: Container(
            padding: widget.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: widget.textStyle,
                  textAlign: widget.textAlign,
                ),
              ],
            ),
          ),
        ),
      ) : InkWell(
        onTap: () {
          if (widget.state != null && widget.state == ButtonState.enabled) {
            widget.onTap?.call();
          }
        },
        child: Container(
          padding: widget.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: widget.textStyle,
                textAlign: widget.textAlign,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
