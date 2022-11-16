import 'package:get/get.dart';

import '../Model/Model.dart';

class Coffeecontroller extends GetxController {
  var list = [];
  var cart = [].obs;
  var favo = [];
  var count = 0.obs;
  var cartcount = 0;
  var d = [2, 4, 5, 2];
  int? initial;

  getFavolist(Model model) {
    var currID = model.id;

    var d = cart.any((element) => element.id == currID);
    if (d == true) {
      return;
    }
    favo.add(model);
  }

  removeCart(Model model) {
    if (model.value == 0) {
      model.value = 0;
      return;
    }
    if (model.price == 0) {
      model.price = 0;
      return;
    }
    var singleprice = model.price ~/ model.value;

    for (var i = 1; i <= model.value; i++) {
      count--;
      // model.value = model.value - 1;
      cart.remove(model);
      if (i == model.value) {
        model.value = 1;
        model.price = singleprice;
        return;
      }
      model.price = model.price - singleprice;
      // print(model.price);
    }
  }

  getCartlist(Model model) {
    count++;
    var currID = model.id;
    print('object');

    var d = cart.any((element) => element.id == currID);
    if (d == true) {
      model.value++;
      model.price = model.price + initial!;
      print(model.price);
      update();
      return;
    }
    gothere(model.price);
    cart.add(model);
  }

  gothere(int price) {
    initial = price;
  }

  minusCartlist(Model model) {
    var singleprice = model.price ~/ model.value;
    print('singleprice minuscart');
    print(singleprice);
    if (model.value == 0) {
      model.value = 0;
      return;
    }
    if (model.price == 0) {
      model.price = 0;
      return;
    }
    count--;
    model.price = model.price - singleprice;
    model.value--;
    update();
  }

  getFav(int id) {
    var newfav = list[id];
    newfav.flag = !newfav.flag;
    update();
  }

  filterCoffee(String coffee) {
    print(coffee);
    if (coffee == 'All') {
      return getCoffeedata();
    }
    getCoffeedata();
    var d = list.where((c) => c.name == coffee).toList();
    list = d;
    update();
    print(coffee);
  }

  @override
  void onInit() {
    super.onInit();
    getCoffeedata();
  }

  getCoffeedata() {
    List<Model> newlist = [
      Model(
          id: 0,
          name: 'Latte',
          image:
              'https://c1.wallpaperflare.com/preview/316/926/571/coffee-cup-beverage-espresso.jpg',
          price: 40,
          ingredients: 'with oat milk',
          flag: false),
      Model(
          id: 1,
          name: 'Cappuccino',
          image:
              'https://c1.wallpaperflare.com/preview/960/362/565/hot-chocolate-beverage-drink-cup-of-coffee.jpg',
          price: 60,
          ingredients: 'with almonds milk',
          flag: false),
      Model(
          id: 2,
          name: 'Americano',
          image:
              'https://c1.wallpaperflare.com/preview/543/359/712/coffee-chocolate-tasty-mug.jpg',
          price: 80,
          ingredients: 'with onion milk',
          flag: false),
      Model(
          id: 3,
          name: 'Macchiato',
          image:
              'https://c1.wallpaperflare.com/preview/1008/186/465/coffee-coffee-cup-hot-coffee-steam.jpg',
          price: 100,
          ingredients: 'with garlic milk',
          flag: false),
      Model(
          id: 4,
          name: 'Mocha',
          image:
              'https://img.freepik.com/free-vector/white-cup-hot-coffee-with-cinnamon-saucer-beans-wooden-table-realistic_1284-56783.jpg?w=740&t=st=1663160905~exp=1663161505~hmac=26371e4b995a6eb9e84b07eec842d0756596e95c19ef5d538e7d3e2ee28d27e8',
          price: 90,
          ingredients: 'with cheese milk',
          flag: false),
      Model(
          id: 5,
          name: 'Dopio',
          image:
              'https://c4.wallpaperflare.com/wallpaper/515/947/746/coffee-espresso-cappuccino-cup-wallpaper-preview.jpg',
          price: 65,
          ingredients: 'with soyabeen milk',
          flag: false),
      // Model(
      //     id: 0,
      //     name: 'Latte',
      //     image:
      //         'https://c1.wallpaperflare.com/preview/316/926/571/coffee-cup-beverage-espresso.jpg',
      //     price: 40,
      //     ingredients: 'with oat milk',
      //     flag: false),
      // Model(
      //     id: 1,
      //     name: 'Cappuccino',
      //     image:
      //         'https://c1.wallpaperflare.com/preview/960/362/565/hot-chocolate-beverage-drink-cup-of-coffee.jpg',
      //     price: 60,
      //     ingredients: 'with almonds milk',
      //     flag: false),
      // Model(
      //     id: 2,
      //     name: 'Americano',
      //     image:
      //         'https://c1.wallpaperflare.com/preview/543/359/712/coffee-chocolate-tasty-mug.jpg',
      //     price: 80,
      //     ingredients: 'with onion milk',
      //     flag: false),
      // Model(
      //     id: 3,
      //     name: 'Macchiato',
      //     image:
      //         'https://c1.wallpaperflare.com/preview/1008/186/465/coffee-coffee-cup-hot-coffee-steam.jpg',
      //     price: 100,
      //     ingredients: 'with garlic milk',
      //     flag: false),
      // Model(
      //     id: 4,
      //     name: 'Mocha',
      //     image:
      //         'https://img.freepik.com/free-vector/white-cup-hot-coffee-with-cinnamon-saucer-beans-wooden-table-realistic_1284-56783.jpg?w=740&t=st=1663160905~exp=1663161505~hmac=26371e4b995a6eb9e84b07eec842d0756596e95c19ef5d538e7d3e2ee28d27e8',
      //     price: 90,
      //     ingredients: 'with cheese milk',
      //     flag: false),
      // Model(
      //     id: 5,
      //     name: 'Dopio',
      //     image:
      //         'https://c4.wallpaperflare.com/wallpaper/515/947/746/coffee-espresso-cappuccino-cup-wallpaper-preview.jpg',
      //     price: 65,
      //     ingredients: 'with soyabeen milk',
      //     flag: false),
    ];
    list.assignAll(newlist);
    update();
  }
}
