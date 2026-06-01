import 'package:flutter/material.dart';

class AnimatedReveal extends StatelessWidget {
  const AnimatedReveal({
    required this.child,
    this.delay = Duration.zero,
    super.key,
  });

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 720),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        final delayRatio = delay.inMilliseconds / 720;
        final delayedValue = ((value - delayRatio) / (1 - delayRatio)).clamp(
          0.0,
          1.0,
        );
        return Opacity(
          opacity: delayedValue,
          child: Transform.translate(
            offset: Offset(0, 24 * (1 - delayedValue)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
