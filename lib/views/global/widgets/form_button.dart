import 'package:flutter/material.dart';

abstract class FormButtonStyle {
  final Color color;
  final Color pressedColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final double letterSpacing;

  const FormButtonStyle({
    this.color,
    this.pressedColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.fontSize,
    this.letterSpacing,
  });
}

class FormButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final FormButtonStyle buttonStyle;

  FormButton({
    this.text,
    this.onTap,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onTap ?? () {},
      padding: EdgeInsets.symmetric(
        vertical: buttonStyle.verticalPadding,
        horizontal: buttonStyle.horizontalPadding,
      ),
      color: buttonStyle.color,
      highlightColor: buttonStyle.pressedColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: buttonStyle.letterSpacing,
          fontSize: buttonStyle.fontSize,
        ),
      ),
    );
  }
}
