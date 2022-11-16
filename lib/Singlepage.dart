import 'package:coffee_shop/Model/Model.dart';
import 'package:coffee_shop/Textbtn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/Coffeecontroller.dart';

// ignore: must_be_immutable
class Singlepage extends StatelessWidget {
  final coffeecontroller = Get.put(Coffeecontroller());
  int id;
  Model model;
  Singlepage({required this.id, required this.model});

  var text = new RichText(
    text: new TextSpan(
      children: <TextSpan>[
        new TextSpan(
            text: '\$ ',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 20)),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    var list = coffeecontroller.list[id];
    // coffeecontroller.list[id].flag

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 50 / 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        '${list.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_outlined),
                        ),
                        Spacer(),
                        GetBuilder<Coffeecontroller>(builder: (controller) {
                          return IconButton(
                            onPressed: () {
                              coffeecontroller.getFav(id);
                              if (model.flag) {
                                coffeecontroller.favo.add(model);
                              }
                              if (!model.flag) {
                                coffeecontroller.favo.remove(model);
                              }
                            },
                            icon: Icon(
                              list.flag
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.red,
                            ),
                          );
                        })
                      ]),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '${list.name}',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${list.ingredients}',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 209, 204, 204)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        '4.5',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '(2333)',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 230, 222, 222)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 10),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.coffee,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.water_drop,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 47, 43, 43)),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Medium Roasted',
                                // style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "A ${list.name} is a coffee based drink primarily from espresso and milk, The beans are from the plant species called Coffee Arabica, and it was originally only grown in ${list.name} Yemen. If you don't drink dairy milk, you can easily swap it for a plant-based alternative like soy, oat or coconut milk.",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Size',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(child: Textbtn(name: 'Small')),
                        SizedBox(width: 15),
                        Expanded(child: Textbtn(name: 'Medium')),
                        SizedBox(width: 15),
                        Expanded(child: Textbtn(name: 'Large')),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 182, 173, 173)),
                            ),
                            Row(
                              children: [
                                text,
                                Text(
                                  '${list.price}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              onPressed: () {
                                coffeecontroller.getCartlist(model);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
