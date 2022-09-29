import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateron_task/presentation/CartController.dart';
import 'package:plateron_task/presentation/resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  static final MyApp instance = MyApp._internal();
  factory MyApp() => instance;
  MyApp._internal();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plateron",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.dishesRoute,
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
    );
  }
}
