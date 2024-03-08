// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:cs290_app/Pages/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class play extends StatefulWidget {
  const play({super.key});

  @override
  State<play> createState() => _playState();
}

class _playState extends State<play> {
  // go_routes(String r) {
  // setState(() {
  // Navigator.of(context).popAndPushNamed('/$r');
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.grey,
            activeColor: Colors.black38,
            color: Colors.white,
            tabBackgroundColor: Color(0xfff6ccbe),
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                //onPressed: go_routes('HomePage'),
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(icon: Icons.person, text: 'profile'),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
      body: ElevatedButton(
          onPressed: () async {
            FirebaseAuth.instance.signOut();
          },
          child: Text("Log out")
          ),
    );
  }
}
