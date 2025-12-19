import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class AnimatedBubblesBackground extends StatefulWidget {
  const AnimatedBubblesBackground({
    super.key,
    this.speed = 1.0, // 1.0 = ~18s cycle. 1.1 = 10% faster
  });

  final double speed;

  @override
  State<AnimatedBubblesBackground> createState() => _AnimatedBubblesBackgroundState();
}

class _AnimatedBubblesBackgroundState extends State<AnimatedBubblesBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final int baseMs = 18000;
    final int durationMs = (baseMs / widget.speed).round();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: durationMs),
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant AnimatedBubblesBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed) {
      final int baseMs = 18000;
      final int durationMs = (baseMs / widget.speed).round();
      _controller.duration = Duration(milliseconds: durationMs);
      if (!_controller.isAnimating) _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final double t = _controller.value;
        final size = MediaQuery.of(context).size;
        double osc(double phase, double amp) =>
            math.sin(2 * math.pi * (t) + phase) * amp;

        return Stack(
          children: [
            _bubble(
              left: size.width * (0.05 + osc(0.0, 0.02)) - 40,
              top: size.height * (0.15 + osc(1.1, 0.03)),
              size: size.width * 0.55,
              opacity: 0.30,
            ),
            _bubble(
              right: size.width * (0.02 + osc(0.8, 0.02)) - 30,
              top: size.height * (0.02 + osc(1.7, 0.025)) - 20,
              size: size.width * 0.38,
              opacity: 0.30,
            ),
            _bubble(
              left: size.width * (0.55 + osc(1.4, 0.015)),
              top: size.height * (0.38 + osc(0.5, 0.02)),
              size: size.width * 0.42,
              opacity: 0.26,
            ),
            _bubble(
              right: size.width * (0.08 + osc(2.2, 0.02)) - 60,
              bottom: size.height * (0.18 + osc(0.2, 0.02)),
              size: size.width * 0.6,
              opacity: 0.28,
            ),
            _bubble(
              left: size.width * (0.02 + osc(2.7, 0.015)) - 80,
              bottom: size.height * (0.02 + osc(1.9, 0.025)) - 40,
              size: size.width * 0.5,
              opacity: 0.24,
            ),
          ],
        );
      },
    );
  }

  Widget _bubble({
    double? left,
    double? right,
    double? top,
    double? bottom,
    required double size,
    required double opacity,
  }) {
    final bubble = ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 28.0, sigmaY: 28.0),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const SweepGradient(
              colors: [
                Color(0x66FF7A7A),
                Color(0x66FFD27A),
                Color(0x667AFF7A),
                Color(0x667AB6FF),
                Color(0x666E7AFF),
                Color(0x66FF7A7A),
              ],
              stops: [0.0, 0.22, 0.46, 0.70, 0.88, 1.0],
            ),
            border: Border.all(color: Colors.white.withOpacity(0.25), width: 0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.11),
                blurRadius: 24,
                spreadRadius: -6,
                offset: const Offset(-6, -6),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 26,
                spreadRadius: -10,
                offset: const Offset(8, 8),
              ),
            ],
          ),
        ),
      ),
    );
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Opacity(opacity: opacity.clamp(0.0, 1.0), child: bubble),
    );
  }
}

