import 'package:flutter/material.dart';
import 'package:project_crew/presentation/widget/glassmorphic/glass_icon_button.dart';

class GlassBackButton extends StatefulWidget {
  const GlassBackButton({
    super.key,
    required this.onTap,
    this.iconColor = Colors.white,
    this.size = 44,
    this.iconSize = 18,
    this.blur = 56,
    this.backgroundOpacity = 0.16,
    this.borderOpacity = 0.30,
    this.borderWidth = 1.2,
    this.minTapIntervalMs = 700,
  });

  final VoidCallback onTap;
  final Color iconColor;
  final double size;
  final double iconSize;
  final double blur;
  final double backgroundOpacity;
  final double borderOpacity;
  final double borderWidth;
  final int minTapIntervalMs;

  @override
  State<GlassBackButton> createState() => _GlassBackButtonState();
}

class _GlassBackButtonState extends State<GlassBackButton> {
  bool _locked = false;

  void _handleTap() {
    if (_locked) return;
    setState(() {
      _locked = true;
    });
    try {
      widget.onTap();
    } finally {
      Future.delayed(Duration(milliseconds: widget.minTapIntervalMs), () {
        if (!mounted) return;
        setState(() {
          _locked = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _locked ? 0.9 : 1.0,
      child: IgnorePointer(
        ignoring: _locked,
        child: GlassIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onTap: _handleTap,
          iconColor: widget.iconColor,
          size: widget.size,
          iconSize: widget.iconSize,
          blur: widget.blur,
          backgroundOpacity: widget.backgroundOpacity,
          borderOpacity: widget.borderOpacity,
          borderWidth: widget.borderWidth,
        ),
      ),
    );
  }
}


