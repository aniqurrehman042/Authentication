import 'package:authentication/blocs/authentication_bloc.dart';
import 'package:authentication/theme/button_styles.dart';
import 'package:authentication/theme/text_styles.dart';
import 'package:authentication/views/global/widgets/form_button.dart';
import 'package:authentication/views/global/widgets/form_text_input.dart';
import 'package:flutter/material.dart';

class AuthenticationCard extends StatelessWidget {
  const AuthenticationCard(
      this.authenticationBloc,
      this.reverseCardStack,
      );

  final AuthenticationBloc authenticationBloc;
  final void Function() reverseCardStack;

  @override
  Widget build(BuildContext context) {
    /// Authentication Card with rounded top corners
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
      child: Column(
        children: [
          /// Card Heading
          Text(
            'AUTHENTICATION',
            style: kPinkTitleStyle,
          ),

          SizedBox(height: 16.0),

          /// Email Text Field
          FormTextInput(
            hintText: 'Email',
            inputType: TextInputType.emailAddress,
          ),

          SizedBox(height: 16.0),

          /// Password Text Field
          FormTextInput(
            hintText: 'Password',
            inputType: TextInputType.text,
            isPassword: true,
          ),

          SizedBox(height: 24.0),

          /// Connect Button
          SizedBox(
            width: double.infinity,
            child: FormButton(
              text: 'CONNECT',
              buttonStyle: BlueButtonStyle(),
            ),
          ),

          SizedBox(height: 32.0),

          /// Forgotten Password Text
          GestureDetector(
            onTap: () {
              reverseCardStack();
              authenticationBloc.add(AuthenticationEvent.showBackCard);
            },
            child: Text(
              'Forgotten password',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0,
              ),
            ),
          ),

          Expanded(
            child: SizedBox(),
          ),

          /// OR Text
          Text(
            '-OR-',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            ),
          ),

          SizedBox(height: 28.0),

          /// Register Button
          SizedBox(
            width: double.infinity,
            child: FormButton(
              text: 'REGISTER',
              onTap: () {
                reverseCardStack();
                authenticationBloc.add(AuthenticationEvent.showBackCard);
              },
              buttonStyle: PinkButtonStyle(),
            ),
          ),

          SizedBox(height: 48.0),
        ],
      ),
    );
  }
}
