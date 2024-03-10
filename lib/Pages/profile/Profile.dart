// ignore_for_file: prefer_const_constructors

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs290_app/Pages/profile/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _db = FirebaseFirestore.instance;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff6ccbe),
          title: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Text('Profile page',
                style: GoogleFonts.roboto(fontSize: 25, color: Colors.black)),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: _db.collection("Users").doc(currentUser.email).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userdata = snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                color: Color(0xfff6ccbe),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10),
                                  )
                                ],
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/kitty.png'))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                        child: Text(
                      currentUser.email!,
                      style: GoogleFonts.roboto(
                          fontSize: 25, color: Colors.grey[900]),
                    )),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "My Details",
                        style: GoogleFonts.roboto(
                            fontSize: 15, color: Colors.grey[600]),
                      ),
                    ),
                    MyTextBox(
                        text: userdata["firstname"], sectionName: "first Name"),
                    MyTextBox(
                        text: userdata["lastname"], sectionName: "Last Name"),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
