import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  const MyTextBox({super.key, required this.text, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 250, 248, 248),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sectionName),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        Text(text),
      ]),
    );
  }
}
