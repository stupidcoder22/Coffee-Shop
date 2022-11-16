import 'package:coffee_shop/Controller/Coffeecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cartpage extends StatelessWidget {
  final coffeecontroller = Get.put(Coffeecontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: coffeecontroller.cart.length > 0
              ? Obx(
                  (() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: coffeecontroller.cart.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Dismissible(
                            direction: DismissDirection.horizontal,
                            key: Key(UniqueKey().toString()),
                            onDismissed: ((direction) {
                              coffeecontroller
                                  .removeCart(coffeecontroller.cart[index]);
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 65, 62, 62)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              coffeecontroller
                                                  .cart[index].image),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            coffeecontroller.cart[index].name,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          GetBuilder<Coffeecontroller>(
                                              builder: ((controller) {
                                            return Text(
                                              '₹ ${coffeecontroller.cart[index].price}',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            );
                                          }))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              coffeecontroller.getCartlist(
                                                  coffeecontroller.cart[index]);
                                            },
                                            icon: Icon(
                                              Icons.add_circle,
                                              color: Colors.orange,
                                            ),
                                          ),
                                          GetBuilder<Coffeecontroller>(
                                              builder: ((controller) {
                                            return Text(
                                              '${coffeecontroller.cart[index].value}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          })),
                                          IconButton(
                                            onPressed: () {
                                              coffeecontroller.minusCartlist(
                                                  coffeecontroller.cart[index]);
                                            },
                                            icon: Icon(
                                              Icons.remove_circle,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        );
                      })),
                )
              : Center(
                  child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
        ));
  }
}
