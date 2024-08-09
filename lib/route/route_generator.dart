import 'package:firebase_auth_app/route/routes.dart';
import 'package:firebase_auth_app/screens/login_screen.dart';
import 'package:firebase_auth_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.logIn:
        return buildRoute(const LogInScreen(), settings: settings);
      case AppRoutes.signUp:
        return buildRoute(const SignUpScreen(), settings: settings);
      default:
        return buildRoute(const LogInScreen(), settings: settings);
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
  }
}
