import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plateron_task/presentation/cart/cart.dart';
import 'package:plateron_task/presentation/dishes/dishes.dart';

class Routes {
  static const String dishesRoute = "/";
  static const String cartRoute = "/cartRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dishesRoute:
        return MaterialPageRoute(builder: (_) => const DishesView());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    Widget noFound = const Scaffold(
      body: Center(
        child: Text("Page not found"),
      ),
    );
    return MaterialPageRoute(builder: (_) => noFound);
  }
}
