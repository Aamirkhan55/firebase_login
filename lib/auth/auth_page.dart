import 'package:firebase_login/screen/login_screen.dart';
import 'package:firebase_login/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

void toggleScreen() {
  setState(() {
    showLoginPage = !showLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(showRigesterPage:toggleScreen );
    } else {
      return  RegisterScreen(showLoginPage: toggleScreen );
    } 
  }
}