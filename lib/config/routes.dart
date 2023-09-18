import 'package:flutter/material.dart';
import 'package:miss_you/blocs/auth/auth_bloc.dart';
import 'package:miss_you/screens/home_screen.dart';
import 'package:miss_you/screens/welcome_screen.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomeScreen.page()];
    case AuthStatus.unauthenticated:
      return [WelcomeScreen.page()];
  }
}
