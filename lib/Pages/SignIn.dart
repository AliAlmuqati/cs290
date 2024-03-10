// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _emilController = TextEditingController();
final _passwordController = TextEditingController();
final _FirstNameController = TextEditingController();
final _LastNameController = TextEditingController();
final _db = FirebaseFirestore.instance;

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  // Future addUserDetails(String firstname, String lastname, String email) async {
  //   await FirebaseFirestore.instance.collection('Users').add({
  //     'firstname': firstname,
  //     'lastname': lastname,
  //     'email': email,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6ccbe),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assignment_ind_rounded,
                  size: 50,
                ),

                //title
                SizedBox(
                  height: 20,
                ),

                Text(
                  "Register ",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Welcome we are Happy to join us:) ",
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
                        controller: _FirstNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First name',
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
                        controller: _LastNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last  name',
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
                  height: 15,
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
                          hintText: ' Password',
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
                    onTap: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: _emilController.text,
                                password: _passwordController.text);

                        // FirebaseFirestore.instance
                        //     .collection("Users")
                        //     .doc(userCredential.user!.email)
                        //     .set({
                        //   'firstname': _FirstNameController.text,
                        //   'lastname': _LastNameController.text,
                        //   'email': _emilController,
                        // });

                        await FirebaseFirestore.instance
                            .collection("Users")
                            .doc(userCredential.user!.email)
                            .set({
                          "firstname": _FirstNameController.text,
                          "lastname": _LastNameController.text,
                          "email": _emilController.text,
                        });

                        // addUserDetails(_FirstNameController.text,
                        //     _LastNameController.text, _emilController.text);

                        Navigator.of(context).pushReplacementNamed('/play');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          print("The password provided is to weak");
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text('The Password is weeak'),
                                );
                              });
                        } else if (e.code == "email-already-in-use") {
                          print("The account is already exist for that email.");
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text('The account is Already in use '),
                                );
                              });
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Register",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
