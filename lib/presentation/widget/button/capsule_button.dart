import 'package:flutter/material.dart';

class CapsuleButton extends StatefulWidget {
  const CapsuleButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.borderColor,
    this.shadowColor,
    this.borderRadius,
    this.borderWidth,
    this.shadowBlurRadius,
    this.shadowSpreadRadius,
    this.shadowOffsetX,
    this.shadowOffsetY,
    this.border,
    this.boxShadow,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.textStyle,
    this.textAlign,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.enableGauge = false,
    this.gaugeColor,
    this.gaugeGradient,
    this.gaugeDuration = const Duration(milliseconds: 600),
    this.enabled = true,
    this.disabledOpacity = 0.5,
    this.triggerOnFullGauge = false,
  });

  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? shadowColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? shadowBlurRadius;
  final double? shadowSpreadRadius;
  final double? shadowOffsetX;
  final double? shadowOffsetY;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final bool enableGauge;
  final Color? gaugeColor;
  final Gradient? gaugeGradient;
  final Duration gaugeDuration;
  final bool enabled;
  final double disabledOpacity;
  final bool triggerOnFullGauge;

  @override
  State<CapsuleButton> createState() => _CapsuleButtonState();
}

class _CapsuleButtonState extends State<CapsuleButton> {
  bool _isPressed = false;
  bool _hasTriggeredHold = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.enabled,
      child: Semantics(
        button: true,
        enabled: widget.enabled,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: widget.enabled ? 1.0 : widget.disabledOpacity.clamp(0.0, 1.0),
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                _isPressed = true;
                _hasTriggeredHold = false;
              });
            },
            onTapUp: (_) {
              setState(() {
                _isPressed = false;
                _hasTriggeredHold = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _isPressed = false;
                _hasTriggeredHold = false;
              });
            },
            onTap: () {
              if (widget.triggerOnFullGauge && widget.enableGauge) {
                // If hold-to-complete is required, do not trigger on simple tap.
                return;
              }
              widget.onTap.call();
            },
            child: AnimatedScale(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
              scale: _isPressed ? 0.98 : 1.0,
              child: Container(
                margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
                width: widget.width ?? double.infinity,
                height: widget.height,
                decoration: BoxDecoration(
                  color: widget.backgroundColor ?? Colors.black,
                  borderRadius: BorderRadius.circular(widget.borderRadius ?? 9999),
                  border: _resolveBorder(),
                  boxShadow: _resolveBoxShadow(pressed: _isPressed),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (widget.enableGauge)
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(widget.borderRadius ?? 9999),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: _isPressed ? 1.0 : 0.0),
                            duration: widget.gaugeDuration,
                            curve: Curves.easeOut,
                            builder: (context, value, _) {
                              final double progress = value.clamp(0.0, 1.0);
                              if (widget.triggerOnFullGauge &&
                                  widget.enabled &&
                                  !_hasTriggeredHold &&
                                  progress >= 1.0) {
                                _hasTriggeredHold = true;
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  widget.onTap.call();
                                });
                              }
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: progress,
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox.expand(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: widget.gaugeGradient,
                                        color: widget.gaugeGradient == null
                                            ? (widget.gaugeColor ?? Colors.white.withValues(alpha: 0.2))
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    Padding(
                      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          widget.text,
                          textAlign: widget.textAlign ?? TextAlign.center,
                          style: _resolveTextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _resolveTextStyle() {
    final TextStyle base = widget.textStyle ??
        const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        );
    return base.copyWith(
      fontSize: widget.fontSize,
      fontWeight: widget.fontWeight,
      color: widget.textColor,
      letterSpacing: widget.letterSpacing,
      wordSpacing: widget.wordSpacing,
    );
  }

  BoxBorder? _resolveBorder() {
    if (widget.border != null) {
      return widget.border;
    }
    final bool hasBorderWidth = (widget.borderWidth ?? 0) > 0;
    final bool hasBorderColor = widget.borderColor != null;
    if (hasBorderWidth || hasBorderColor) {
      return Border.all(
        color: widget.borderColor ?? Colors.black,
        width: widget.borderWidth ?? 1.0,
      );
    }
    return null; // default: no border
  }

  List<BoxShadow>? _resolveBoxShadow({bool pressed = false}) {
    if (widget.boxShadow != null) {
      return widget.boxShadow;
    }
    final bool anyShadowPropProvided = widget.shadowColor != null ||
        widget.shadowBlurRadius != null ||
        widget.shadowSpreadRadius != null ||
        widget.shadowOffsetX != null ||
        widget.shadowOffsetY != null;
    if (!anyShadowPropProvided) {
      return null;
    }
    final double baseBlur = widget.shadowBlurRadius ?? 8.0;
    final double baseSpread = widget.shadowSpreadRadius ?? 0.0;
    final double baseOffsetX = widget.shadowOffsetX ?? 0.0;
    final double baseOffsetY = widget.shadowOffsetY ?? 2.0;
    final double pressedFactor = pressed ? 0.6 : 1.0;
    return <BoxShadow>[
      BoxShadow(
        color: widget.shadowColor ?? Colors.black.withOpacity(0.2),
        blurRadius: baseBlur * pressedFactor,
        spreadRadius: baseSpread * pressedFactor,
        offset: Offset(
          baseOffsetX * pressedFactor,
          baseOffsetY * pressedFactor,
        ),
      ),
    ];
  }
}
