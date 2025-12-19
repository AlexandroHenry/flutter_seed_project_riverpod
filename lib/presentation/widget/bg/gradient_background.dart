import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Gradient gradient;
  final Widget? child;

  const GradientBackground({
    super.key,
    required this.gradient,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: child,
    );
  }
}

