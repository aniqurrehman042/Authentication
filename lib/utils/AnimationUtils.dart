import 'package:flutter/material.dart';

class AnimationUtils {
  static AnimationController getVerticalSlideAnimationController(TickerProvider tickerProvider) {
    return AnimationController(
      duration: const Duration(seconds: 1),
      vsync: tickerProvider,
    );
  }

  static Animation getVerticalSlideAnimation(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ));
  }
}