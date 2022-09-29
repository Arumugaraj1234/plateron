import 'package:plateron_task/presentation/resources/images.dart';

class Dish {
  int id;
  String name;
  String description;
  double rate;
  String imageLink;

  Dish(this.id, this.name, this.description, this.rate, this.imageLink);
}

List<Dish> dishes = [
  Dish(1, "Biriyani", "description", 15, AssetImages.biriyani),
  Dish(1, "Chicken Roast", "description", 20, AssetImages.biriyani),
  Dish(1, "Pongal", "description", 10, AssetImages.biriyani),
];
