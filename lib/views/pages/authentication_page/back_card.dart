import 'package:authentication/blocs/authentication_bloc.dart';
import 'package:authentication/theme/button_styles.dart';
import 'package:authentication/views/global/widgets/form_button.dart';
import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  final AuthenticationBloc authenticationBloc;
  final void Function() reverseCardStack;

  BackCard(
      this.authenticationBloc,
      this.reverseCardStack,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32.0,
        left: 32.0,
        right: 32.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
      ),

      /// Card Content
      child: Center(
        child: FormButton(
          text: 'BACK',
          onTap: () {
            reverseCardStack();
            authenticationBloc.add(AuthenticationEvent.showAuthenticationCard);
          },
          buttonStyle: PinkButtonStyle(),
        ),
      ),
    );
  }
}
