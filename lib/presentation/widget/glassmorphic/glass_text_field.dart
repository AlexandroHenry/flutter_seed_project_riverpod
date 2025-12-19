import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlassTextField extends StatefulWidget {
  const GlassTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.prefixIcon,
    this.obscureText = false,
    this.showObscureToggle = false,
    this.textColor = Colors.white,
    this.hintColor,
    this.iconColor,
    this.keyboardType,
    this.inputFormatters,
    this.borderRadius = 20.0,
    this.blur = 28.0,
    this.baseOpacity = 0.28,
    this.focusOpacity = 0.36,
    this.baseBorderOpacity = 0.95,
    this.focusBorderOpacity = 1.0,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final TextInputAction textInputAction;
  final void Function(String)? onSubmitted;
  final IconData? prefixIcon;
  final bool obscureText;
  final bool showObscureToggle;
  final Color textColor;
  final Color? hintColor;
  final Color? iconColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final double borderRadius;
  final double blur;
  final double baseOpacity;
  final double focusOpacity;
  final double baseBorderOpacity;
  final double focusBorderOpacity;

  @override
  State<GlassTextField> createState() => _GlassTextFieldState();
}

class _GlassTextFieldState extends State<GlassTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  void didUpdateWidget(covariant GlassTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.obscureText != widget.obscureText) {
      _obscure = widget.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.focusNode,
      builder: (context, _) {
        final bool hasFocus = widget.focusNode.hasFocus;
        final double bgOpacity = hasFocus ? widget.focusOpacity : widget.baseOpacity;
        final double borderOpacity = hasFocus ? widget.focusBorderOpacity : widget.baseBorderOpacity;

        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(bgOpacity),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(color: Colors.white.withOpacity(borderOpacity), width: hasFocus ? 2.0 : 1.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 26,
                    offset: const Offset(0, 12),
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
                            Colors.white.withOpacity(hasFocus ? 0.28 : 0.18),
                            Colors.white.withOpacity(0.08),
                            Colors.white.withOpacity(0.02),
                          ],
                          stops: const [0.0, 0.35, 1.0],
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    obscureText: _obscure,
                    textInputAction: widget.textInputAction,
                    onSubmitted: widget.onSubmitted,
                    keyboardType: widget.keyboardType,
                    inputFormatters: widget.inputFormatters,
                    style: TextStyle(color: widget.textColor, fontSize: 17, fontWeight: FontWeight.w600),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: widget.prefixIcon == null
                          ? null
                          : Icon(
                              widget.prefixIcon,
                              color: (widget.iconColor ?? widget.textColor).withOpacity(hasFocus ? 1.0 : 0.98),
                            ),
                      hintText: widget.hintText,
                      hintStyle: TextStyle( 
                        color: (widget.hintColor ?? widget.textColor.withOpacity(0.6)),
                        fontWeight: FontWeight.w700,
                      ),
                      suffixIcon: widget.showObscureToggle
                          ? IconButton(
                              onPressed: () => setState(() => _obscure = !_obscure),
                              icon: Icon(
                                _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                color: (widget.iconColor ?? widget.textColor).withOpacity(hasFocus ? 1.0 : 0.98),
                              ),
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

