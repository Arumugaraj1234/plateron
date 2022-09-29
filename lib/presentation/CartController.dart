import 'package:get/get.dart';
import 'package:plateron_task/presentation/resources/data.dart';

class CartController extends GetxController {
  final _selectedDishes = <Dish>[].obs;
  final _selectedDishCount = 0.obs;
  final _totalPrice = 0.0.obs;

  List<Dish> get selectedDishes => _selectedDishes;
  int get selectedDishesCount => _selectedDishCount.value;
  double get totalPrice => _totalPrice.value;

  addDish(Dish dish) {
    _selectedDishes.add(dish);
    _getSelectedDishesCount();
    _getTotalPrice();
  }

  _getSelectedDishesCount() {
    _selectedDishCount.value = _selectedDishes.toSet().toList().length;
  }

  int dishCount(Dish dish) {
    List<Dish> sameItems = [];
    for (var element in _selectedDishes) {
      if (dish == element) {
        sameItems.add(element);
      }
    }
    return sameItems.length;
  }

  increaseProduct(Dish dish) {
    _selectedDishes.add(dish);
    _getSelectedDishesCount();
    _getTotalPrice();
  }

  decreaseProduct(Dish dish) {
    int lastIndex = _selectedDishes.lastIndexOf(dish);
    _selectedDishes.removeAt(lastIndex);
    _getSelectedDishesCount();
    _getTotalPrice();
  }

  _getTotalPrice() {
    _totalPrice.value = _selectedDishes.isNotEmpty
        ? _selectedDishes
            .map((element) => element.rate)
            .reduce((value, element) => value + element)
        : 0;
  }
}
