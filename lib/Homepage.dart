import 'package:coffee_shop/View/Cartpage.dart';
import 'package:coffee_shop/View/Favoritepage.dart';
import 'package:coffee_shop/View/Home.dart';
import 'package:coffee_shop/View/Notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/Coffeecontroller.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final coffeecontroller = Get.put(Coffeecontroller());

  int index = 0;
  void changeIndex(newindex) {
    print(newindex);
    setState(() {
      index = newindex;
    });
  }

  List<Widget> widgetlist = [
    Home(),
    Cartpage(),
    Favoritepage(),
    Notificationpage(),
  ];

  @override
  Widget build(BuildContext context) {
    print(index);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: (() => changeIndex(1)),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx((() => Text(
                            '${coffeecontroller.count}',
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          ))),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: widgetlist[index],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
          ],
          currentIndex: index,
          selectedItemColor: Color.fromARGB(255, 204, 137, 43),
          onTap: changeIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
