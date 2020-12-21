import 'package:authentication/utils/AnimationUtils.dart';
import 'package:authentication/utils/state_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum AuthenticationEvent {
  initialize,
  showBackCard,
  showAuthenticationCard,
}

class AuthenticationBlocState {
  AnimationController authenticationSlideAnimationController;
  Animation authenticationSlideAnimation;
  AnimationController backSlideAnimationController;
  Animation backSlideAnimation;
  List<Widget> cardStackChildren;

  AuthenticationBlocState({
    this.authenticationSlideAnimationController,
    this.authenticationSlideAnimation,
    this.backSlideAnimationController,
    this.backSlideAnimation,
    this.cardStackChildren,
  });
}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationBlocState> {
  AuthenticationBloc(this.tickerProvider)
      : super(StateUtils.getAuthenticationBlocInitialState(tickerProvider));

  final TickerProvider tickerProvider;

  @override
  Stream<AuthenticationBlocState> mapEventToState(
      AuthenticationEvent event) async* {
    switch (event) {
      case AuthenticationEvent.initialize:
        state.authenticationSlideAnimationController.forward();
        yield state;
        break;
      case AuthenticationEvent.showAuthenticationCard:
        showAuthenticationCard();
        yield state;
        break;
      case AuthenticationEvent.showBackCard:
        showBackCard();
        yield state;
        break;
    }
  }

  void showBackCard() {
    if (state.authenticationSlideAnimation.value.dy == 0.0) {
      state.authenticationSlideAnimationController.reverse();
      state.backSlideAnimationController.forward();
    }
  }

  void showAuthenticationCard() {
    if (state.backSlideAnimation.value.dy == 0) {
      state.backSlideAnimationController.reverse();
      state.authenticationSlideAnimationController.forward();
    }
  }
}
