import 'dart:math' as math;
import 'package:flutter/material.dart';

class RetryLoadingView extends StatefulWidget {
  const RetryLoadingView({
    super.key,
    required this.onRetry,
    this.title = 'Something went wrong',
    this.subtitle,
    this.retryText = 'Retry',
    this.icon = Icons.refresh_rounded,
    this.iconColor = Colors.black54,
    this.showSpinner = true,
    this.spinDuration = const Duration(milliseconds: 1200),
    this.isRetrying = false,
  });

  final VoidCallback onRetry;
  final String title;
  final String? subtitle;
  final String retryText;
  final IconData icon;
  final Color iconColor;
  final bool showSpinner;
  final Duration spinDuration;
  final bool isRetrying;

  @override
  State<RetryLoadingView> createState() => _RetryLoadingViewState();
}

class _RetryLoadingViewState extends State<RetryLoadingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      vsync: this,
      duration: widget.spinDuration,
    );
    if (widget.showSpinner) {
      _rotateController.repeat();
    }
  }

  @override
  void didUpdateWidget(RetryLoadingView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showSpinner != widget.showSpinner ||
        oldWidget.spinDuration != widget.spinDuration) {
      _rotateController.duration = widget.spinDuration;
      if (widget.showSpinner) {
        _rotateController.repeat();
      } else {
        _rotateController.stop();
      }
    }
  }

  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSpinner(),
          const SizedBox(height: 16),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          if (widget.subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              widget.subtitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
            ),
          ],
          const SizedBox(height: 16),
          _buildRetryButton(context),
        ],
      ),
    );
  }

  Widget _buildSpinner() {
    if (!widget.showSpinner) {
      return const SizedBox(height: 64);
    }
    return SizedBox(
      width: 56,
      height: 56,
      child: AnimatedBuilder(
        animation: _rotateController,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotateController.value * 2 * math.pi,
            child: child,
          );
        },
        child: Icon(
          widget.icon,
          size: 42,
          color: widget.iconColor,
        ),
      ),
    );
  }

  Widget _buildRetryButton(BuildContext context) {
    final bool disabled = widget.isRetrying;
    return Semantics(
      button: true,
      enabled: !disabled,
      child: ElevatedButton(
        onPressed: disabled ? null : widget.onRetry,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isRetrying) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.isRetrying ? 'Retrying...' : widget.retryText,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}