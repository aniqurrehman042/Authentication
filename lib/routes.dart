import 'package:flutter/material.dart';
import 'views/pages/authentication_page/authentication_page.dart';

Route<dynamic> getOnGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthenticationPage.tag:
      return MaterialPageRoute(builder: (context) => AuthenticationPage());
    default:
      return MaterialPageRoute(builder: (context) => AuthenticationPage());
  }
}