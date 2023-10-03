import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
    return ProfileScreen(
      providers: providers,
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, '/login');
        }),
      ],
    );
  }
}
