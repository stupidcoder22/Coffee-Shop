import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/Coffeecontroller.dart';

// ignore: must_be_immutable
class Coffeelist extends StatelessWidget {
  List coffee = ['All','Latte', 'Cappuccino', 'Americano', 'Macchiato', 'Mocha'];
  final coffeecontroller = Get.put(Coffeecontroller());

  @override
  Widget build(BuildContext context) {
    var coffeelist = coffee.map((e) {
      return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
              onPressed: () {
                coffeecontroller.filterCoffee(e);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                foregroundColor: MaterialStateProperty.all((Colors.black)),
              ),
              child: Text(
                e,
                style: TextStyle(),
              )));
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [...coffeelist],
      ),
    );
  }
}
