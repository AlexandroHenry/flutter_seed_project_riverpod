import 'dart:ui';
import 'package:flutter/material.dart';

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 44.0,
    this.iconSize = 20.0,
    this.blur = 36.0,
    this.backgroundOpacity = 0.16,
    this.borderOpacity = 0.30,
    this.borderWidth = 1.2,
    this.iconColor = Colors.white,
    this.shadowBlurRadius = 20.0,
  });

  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final double iconSize;
  final double blur;
  final double backgroundOpacity;
  final double borderOpacity;
  final double borderWidth;
  final Color iconColor;
  final double shadowBlurRadius;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(backgroundOpacity),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withOpacity(borderOpacity),
              width: borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: shadowBlurRadius,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              child: Center(
                child: Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


