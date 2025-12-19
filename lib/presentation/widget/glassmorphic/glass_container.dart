import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
    this.borderRadius = 24.0,
    this.blur = 20.0,
    this.backgroundOpacity = 0.12,
    this.borderOpacity = 0.26,
    this.borderWidth = 1.0,
    this.shadowColor,
    this.shadowBlurRadius = 20.0,
    this.shadowOffset = const Offset(0, 10),
  });

  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final double blur;
  final double backgroundOpacity;
  final double borderOpacity;
  final double borderWidth;
  final Color? shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(backgroundOpacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(borderOpacity),
              width: borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.white.withOpacity(0.28),
                blurRadius: shadowBlurRadius,
                offset: shadowOffset,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

