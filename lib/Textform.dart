import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basic_utils/basic_utils.dart';
import 'Controller/Coffeecontroller.dart';

// ignore: must_be_immutable
class Textform extends StatelessWidget {
  final coffeecontroller = Get.put(Coffeecontroller());
  String name = '';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        name = value;
      },
      decoration: InputDecoration(
          prefixIcon: IconButton(
              onPressed: () {
                coffeecontroller.filterCoffee(StringUtils.capitalize(name));
              },
              icon: Icon(
                Icons.search,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          hintText: 'Search Your Coffee'),
    );
  }
}
