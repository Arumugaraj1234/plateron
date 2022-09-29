import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plateron_task/presentation/CartController.dart';
import 'package:plateron_task/presentation/resources/data.dart';
import 'package:plateron_task/presentation/resources/images.dart';
import 'package:plateron_task/presentation/resources/styles_manager.dart';

class DishesView extends StatefulWidget {
  const DishesView({Key? key}) : super(key: key);

  @override
  _DishesViewState createState() => _DishesViewState();
}

class _DishesViewState extends State<DishesView> {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Salad & Soups",
              style: getBoldStyle(),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      Dish dish = dishes[index];
                      return GetX<CartController>(builder: (snapshot) {
                        return DishWidget(dish, snapshot.dishCount(dish), () {
                          if (cartController.dishCount(dish) == 0) {
                            cartController.addDish(dish);
                          } else {
                            cartController.increaseProduct(dish);
                          }
                        }, () {
                          if (cartController.dishCount(dish) != 0) {
                            cartController.decreaseProduct(dish);
                          }
                        });
                      });
                    })),
            Container(
              height: 70,
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 25,
                  ),
                  Expanded(
                    child: GetX<CartController>(builder: (snapshot) {
                      return Text(
                        snapshot.selectedDishesCount.toString() + " Items",
                        style: getMediumStyle(),
                      );
                    }),
                  ),
                  GetX<CartController>(builder: (snapshot) {
                    return Text(
                      "Total Amount: \$ " + snapshot.totalPrice.toString(),
                      style: getMediumStyle(),
                    );
                  }),
                  InkWell(
                    onTap: () {
                      //todo: Navigate to cart view
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text("Place Order"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DishWidget extends StatelessWidget {
  final Dish dish;
  final int noOfDishSelected;
  final VoidCallback onAdded;
  final VoidCallback onRemoved;

  const DishWidget(
    this.dish,
    this.noOfDishSelected,
    this.onAdded,
    this.onRemoved, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(dish.imageLink), fit: BoxFit.fill)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dish.name,
                style: getMediumStyle(),
              ),
              Text(
                dish.description,
                style: getRegularStyle(),
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Text("\$" + dish.rate.toString()),
                  Expanded(child: SizedBox()),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Icon(Icons.remove_circle),
                          onTap: onRemoved,
                        ),
                        Text(noOfDishSelected.toString()),
                        InkWell(
                          child: Icon(Icons.add),
                          onTap: onAdded,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
