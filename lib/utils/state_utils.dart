import 'package:authentication/blocs/authentication_bloc.dart';
import 'package:authentication/utils/AnimationUtils.dart';
import 'package:flutter/material.dart';

class StateUtils {
  static AuthenticationBlocState getAuthenticationBlocInitialState(
      TickerProvider tickerProvider) {
    var authenticationController =
        AnimationUtils.getVerticalSlideAnimationController(tickerProvider);
    var backController =
        AnimationUtils.getVerticalSlideAnimationController(tickerProvider);

    return AuthenticationBlocState(
      authenticationSlideAnimationController: authenticationController,
      authenticationSlideAnimation:
          AnimationUtils.getVerticalSlideAnimation(authenticationController),
      backSlideAnimationController: backController,
      backSlideAnimation:
          AnimationUtils.getVerticalSlideAnimation(backController),
    );
  }
}
