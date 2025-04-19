import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_corn/app_corns.dart';
import 'package:techtaste/ui/_corn/bag_provider.dart';
import 'package:techtaste/ui/_corn/widget/appBar.dart';

import '../../model/dish.dart';
import '../dish/dishes_screen.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 12.0,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/${restaurant.imagePath}', width: 128),
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Mais pedidos',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        color: AppColors.mainColor
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    spacing: 16,
                    children: List.generate(
                      restaurant.dishes.length,
                      (index){
                        Dish dish = restaurant.dishes[index];
                        return DishesScreen(dish: dish,);
                      }
                    ),
                  ),
                ),
                SizedBox(height: 32.0,),
              ],
            ),
        ),
        ),
    );
  }
}
