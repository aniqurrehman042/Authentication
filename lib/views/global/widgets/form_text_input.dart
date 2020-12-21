import 'package:authentication/theme/text_styles.dart';
import 'package:flutter/material.dart';

class FormTextInput extends StatelessWidget {

  final TextInputType inputType;
  final String hintText;
  final bool isPassword;

  const FormTextInput({
    this.inputType,
    this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kInputHintStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
      ),
    );
  }
}
