import 'dart:ui';
import 'package:flutter/material.dart';

class GlassButton extends StatefulWidget {
  const GlassButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 52.0,
    this.borderRadius = 9999.0,
    this.blur = 18.0,
    this.backgroundOpacity = 0.14,
    this.borderOpacity = 0.30,
    this.textStyle,
    this.pressedScale = 0.98,
    this.animationDuration = const Duration(milliseconds: 110),
  });

  final String text;
  final VoidCallback onTap;
  final double height;
  final double borderRadius;
  final double blur;
  final double backgroundOpacity;
  final double borderOpacity;
  final TextStyle? textStyle;
  final double pressedScale;
  final Duration animationDuration;

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _pressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _pressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _pressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double scale = _pressed ? widget.pressedScale : 1.0;
    final double bgOpacity = _pressed
        ? (widget.backgroundOpacity + 0.06).clamp(0.0, 1.0)
        : widget.backgroundOpacity;
    final double borderOpacity = _pressed
        ? (widget.borderOpacity + 0.10).clamp(0.0, 1.0)
        : widget.borderOpacity;
    final double shadowOpacity = _pressed ? 0.16 : 0.28;
    final double blurRadius = _pressed ? 12 : 18;
    final double yOffset = _pressed ? 4 : 8;

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: widget.onTap,
      child: AnimatedScale(
        duration: widget.animationDuration,
        curve: Curves.easeOut,
        scale: scale,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
            child: AnimatedContainer(
              duration: widget.animationDuration,
              curve: Curves.easeOut,
              height: widget.height,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(bgOpacity),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: Colors.white.withOpacity(borderOpacity),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(shadowOpacity),
                    blurRadius: blurRadius,
                    offset: Offset(0, yOffset),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(widget.borderRadius),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.20),
                            Colors.white.withOpacity(0.06),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.35, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.text,
                      style: widget.textStyle ??
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}