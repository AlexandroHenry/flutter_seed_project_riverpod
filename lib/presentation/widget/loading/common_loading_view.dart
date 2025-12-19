import 'package:flutter/material.dart';

class CommonLoadingView extends StatefulWidget {
  const CommonLoadingView({super.key});

  @override
  State<CommonLoadingView> createState() => _CommonLoadingViewState();
}

class _CommonLoadingViewState extends State<CommonLoadingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fillController;

  @override
  void initState() {
    super.initState();
    _fillController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color spinnerColor = Colors.black;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(spinnerColor),
              backgroundColor: Colors.black12,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: _fillController,
            builder: (context, _) {
              final double fill = _fillController.value; // 0.0 → 1.0 → 0.0
              return _AnimatedGradientText(
                text: 'BRAINMAXIMIZER',
                fill: fill,
                baseColor: Colors.black,
                gradient: const LinearGradient(
                  colors: <Color>[
                    Color(0xFFFF5252), // red
                    Color(0xFFFFA726), // orange
                    Color(0xFFFFEB3B), // yellow
                    Color(0xFF66BB6A), // green
                    Color(0xFF42A5F5), // blue
                    Color(0xFF7E57C2), // indigo
                    Color(0xFFE91E63), // pink
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AnimatedGradientText extends StatelessWidget {
  const _AnimatedGradientText({
    required this.text,
    required this.fill,
    required this.baseColor,
    required this.gradient,
    required this.style,
  });

  final String text;
  final double fill; // 0.0 ~ 1.0
  final Color baseColor;
  final Gradient gradient;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    // Base black text
    final Widget base = Text(
      text,
      textAlign: TextAlign.center,
      style: style.copyWith(color: baseColor),
    );

    // Gradient text that is horizontally clipped by fill (0~1)
    final Widget gradientText = ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white),
      ),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        base,
        // Clip the gradient text from the left by 'fill' fraction
        ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: fill.clamp(0.0, 1.0),
            child: gradientText,
          ),
        ),
      ],
    );
  }
}