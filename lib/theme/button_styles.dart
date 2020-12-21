import 'package:authentication/views/global/widgets/form_button.dart';
import 'package:flutter/material.dart';

class BlueButtonStyle implements FormButtonStyle {
  Color color =  Colors.blue;
  Color pressedColor = Colors.pink;
  double fontSize = 18.0;
  double letterSpacing = 1.0;
  double horizontalPadding = 8.0;
  double verticalPadding = 8.0;

  BlueButtonStyle._privateConstructor();

  static final BlueButtonStyle _instance = BlueButtonStyle._privateConstructor();

  factory BlueButtonStyle() {
    return _instance;
  }
}

class PinkButtonStyle implements FormButtonStyle {
  Color color =  Colors.pink;
  Color pressedColor = Colors.blue;
  double fontSize = 18.0;
  double letterSpacing = 1.0;
  double horizontalPadding = 8.0;
  double verticalPadding = 8.0;

  PinkButtonStyle._privateConstructor();

  static final PinkButtonStyle _instance = PinkButtonStyle._privateConstructor();

  factory PinkButtonStyle() {
    return _instance;
  }
}