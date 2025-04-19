import 'package:flutter/material.dart';
import 'package:techtaste/model/dish.dart';
import 'package:techtaste/ui/dish/dish_screen.dart';

import '../_corn/app_corns.dart';

class DishesScreen extends StatelessWidget {
  final Dish dish;
  const DishesScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context){
                return DishScreen(dish: dish);
              }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          children: [
            Image.asset('assets/dishes/default.png'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dish.name, style: TextStyle( color: AppColors.mainColor),),
                      Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                    ],
                  ),
                  Text(dish.description.split(".")[0] + '.')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
