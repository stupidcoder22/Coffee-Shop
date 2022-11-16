import 'package:coffee_shop/Controller/Coffeecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/Model.dart';

// ignore: must_be_immutable
class Favoritepage extends StatelessWidget {
  final coffeecontroller = Get.put(Coffeecontroller());

  Model? model;

  Favoritepage({this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: coffeecontroller.favo.length > 0
          ? ListView.builder(
              itemCount: coffeecontroller.favo.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 65, 62, 62)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            width: 70,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  coffeecontroller.favo[index].image),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                coffeecontroller.favo[index].name,
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '₹ ${coffeecontroller.favo[index].price}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }))
          : Center(
              child: Text(
              'Your Favorite Section is Empty',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
    );
  }
}
