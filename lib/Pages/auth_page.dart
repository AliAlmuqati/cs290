import 'package:cs290_app/Pages/HomePage.dart';
import 'package:cs290_app/Pages/LoginPage.dart';
import 'package:cs290_app/Pages/play.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return play();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
