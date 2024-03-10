// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "images/asas.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/play');
                      },
                      child: Text(
                        "Play",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 70)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Profile');
                      },
                      // ignore: sort_child_properties_last
                      child: Text("Profile"),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 70)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
