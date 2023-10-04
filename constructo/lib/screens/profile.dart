import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
