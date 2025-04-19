import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/data/categories_data.dart';
import 'package:techtaste/data/restaurant_data.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_corn/app_corns.dart';
import 'package:techtaste/ui/_corn/widget/appBar.dart';
import 'package:techtaste/ui/home/Widgets/category_widget.dart';
import 'package:techtaste/ui/home/Widgets/restauran_widget.dart';

import '../restaurant/restaurant_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData =
    Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 60,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Column(
              children: List.generate(
                    restaurantData.listRestaurant.length,
                        (index){
                      Restaurant restaurant =
                      restaurantData.listRestaurant[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return RestaurantScreen(restaurant: restaurant);
                                }),
                          );
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                restaurant.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                        ),
                      );
                    }
                ),
            )
          ],
        ),
      ),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/logo.png', width: 147)
              ),
              Text("Boas-vindas!"),
              //TextFormField(),
              Text("Escolha por categoria"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children:
                    List.generate(
                      CategoriesData.listaCategories.length,
                      (index){
                        return CategoryWidget(
                            category: CategoriesData.listaCategories[index],
                        );
                      }),
                  ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem avaliados"),
              Column(
                spacing: 16.0,
                children: List.generate(
                    restaurantData.listRestaurant.length,
                    (index){
                      Restaurant restaurant =
                      restaurantData.listRestaurant[index];
                      return RestaurantWidget(restaurant: restaurant);
                    }
                ),
              ),
              SizedBox(height: 64.0,),
            ],
          ),
        ),
      ),
    );
  }
}
