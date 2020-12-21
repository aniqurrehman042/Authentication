import 'dart:async';

import 'package:authentication/blocs/authentication_bloc.dart';
import 'package:authentication/data/models/fading_image.dart';
import 'package:authentication/theme/assets.dart';
import 'package:authentication/views/global/widgets/fading_image_gallery.dart';
import 'package:flutter/material.dart';

import 'authentication_card.dart';
import 'back_card.dart';

class AuthenticationPage extends StatefulWidget {
  static const tag = 'AuthenticationPage';

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with TickerProviderStateMixin {
  AuthenticationBloc authenticationBloc;
  List<Widget> cardStack;
  List<FadingImage> images = [
    FadingImage(
      asset: Assets.canal,
      isVisible: true,
    ),
    FadingImage(
      asset: Assets.street,
    ),
    FadingImage(
      asset: Assets.waterfall,
    ),
  ];

  @override
  void initState() {
    super.initState();

    /// Initialize Authentication Bloc
    authenticationBloc = AuthenticationBloc(this);

    /// Initialize Card Stack
    cardStack = [
      /// Back Button Card
      SlideTransition(
        position: authenticationBloc.state.backSlideAnimation,
        child: BackCard(authenticationBloc, reverseCardStack),
      ),

      /// Authentication Card
      SlideTransition(
        position: authenticationBloc.state.authenticationSlideAnimation,
        child: AuthenticationCard(authenticationBloc, reverseCardStack),
      ),
    ];

    /// Set delay before content slides up initially
    Timer(Duration(seconds: 1), () {
      authenticationBloc.add(AuthenticationEvent.initialize);
    });
  }

  void reverseCardStack() {
    setState(() {
      cardStack = List.from(cardStack.reversed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          FadingImageGallery(
            images: images,
            height: double.infinity,
            width: double.infinity,
          ),

          /// Page Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Upper 1/3 part
              Expanded(
                flex: 1,

                /// Column used for aligning text
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32.0,
                        bottom: 4.0,
                      ),

                      /// Connection Heading
                      child: Text(
                        'Connection',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Lower 2/3 part with sliding card
              Expanded(
                flex: 2,

                /// Card Stack
                child: Stack(
                  children: cardStack,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    authenticationBloc.close();

    super.dispose();
  }
}
