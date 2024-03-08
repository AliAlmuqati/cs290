// ignore_for_file: non_constant_identifier_names, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _emilController = TextEditingController();
final _passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _EroorMesage_Email() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('The Email proveded is not  in use '),
            content: Text('You can register with us now!'),
           
          );
        });
  }

  void _EroorMesage_Password() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('The Password proveded is Incorrect '),
            
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Future signUserIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emilController.text, password: _passwordController.text);
        Navigator.of(context).pushReplacementNamed('/play');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          _EroorMesage_Email();
          //print("No user found for that email.");
        } else if (e.code == 'wrong-password') {
          //print("Wrong password provided for that user");
          _EroorMesage_Password();
        }
      }
    }

    return Scaffold(
        backgroundColor: Color(0xfff6ccbe),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    size: 50,
                  ),

                  //title
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Log in",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome back ! Nice to see you again ",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  //text  field

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _emilController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: ()  {
                        signUserIn();
                      
                        
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.roboto(
                                color: Colors.orange[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not yet a member? "),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                          child: Text(
                            "  Sign up Now",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
