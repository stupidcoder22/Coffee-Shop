class Model {
  int id;
  String name;
  String image;
  int price;
  String ingredients;
  bool flag;
  int value;

  Model(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.ingredients,
      required this.flag,
      this.value = 1});
}
