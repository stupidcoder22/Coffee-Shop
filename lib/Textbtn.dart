import 'package:flutter/material.dart';

class Textbtn extends StatelessWidget {
  String name;
  Textbtn({required this.name});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 47, 43, 43)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () {},
      child: Text(
        '$name',
        // style: TextStyle(color: Colors.white),
      ),
    );
  }
}
