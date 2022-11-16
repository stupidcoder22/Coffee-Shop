import 'package:coffee_shop/Controller/Coffeecontroller.dart';
import 'package:coffee_shop/Singlepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class Coffecard extends StatelessWidget {
  final coffeecontroller = Get.put(Coffeecontroller());

  var text = new RichText(
    text: new TextSpan(
      children: <TextSpan>[
        new TextSpan(
            text: '\₹ ',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: 20)),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Coffeecontroller>(
        builder: (controller) => GridView.builder(
              physics: ScrollPhysics(),
              itemCount: coffeecontroller.list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 4.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
              ),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => Singlepage(
                          id: index,
                          model: controller.list[index],
                        ));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: HexColor('#292929'),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  controller.list[index].image,
                                  width: MediaQuery.of(context).size.width,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                controller.list[index].name,
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                controller.list[index].ingredients,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 194, 193, 193),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      text,
                                      Text(
                                        '${controller.list[index].price}',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      controller
                                          .getCartlist(controller.list[index]);
                                    },
                                    icon: Icon(Icons.add_circle_rounded),
                                    iconSize: 26,
                                    color: Colors.orange,
                                  )
                                ],
                              )
                            ],
                          ))),
                );
              }),
            ));
  }
}
