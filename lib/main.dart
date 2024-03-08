import 'package:cs290_app/Pages/HomePage.dart';
import 'package:cs290_app/Pages/LoginPage.dart';
import 'package:cs290_app/Pages/MainPage.dart';
import 'package:cs290_app/Pages/SignIn.dart';
import 'package:cs290_app/Pages/play.dart';
import 'package:cs290_app/Pages/splash.dart';
import 'package:cs290_app/firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const splash(),
        '/MainPage':(context) => const MainPage(),
        '/HomePage': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/LoginPage': (context) => LoginPage(),
        '/signin': (context) => const SignIn(),
        '/play': (context) => const play(),
      },
    );
  }
}
