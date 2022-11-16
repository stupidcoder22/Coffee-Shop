import 'package:flutter/material.dart';

import '../Coffecard.dart';
import '../Coffeelist.dart';
import '../Textform.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            Text(
              'Find the best coffee for you',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            Textform(),
            SizedBox(
              height: 20,
            ),
            Coffeelist(),
            SizedBox(
              height: 20,
            ),
            Coffecard(),
          ],
        ),
      ),
    );
  }
}
