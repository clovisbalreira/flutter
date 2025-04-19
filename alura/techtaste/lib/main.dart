import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/data/restaurant_data.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_corn/app_theme.dart';
import 'package:techtaste/ui/_corn/bag_provider.dart';
import 'package:techtaste/ui/splash/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (content) {
                return restaurantData;
              },
          ),
          ChangeNotifierProvider(create: (context) => BagProvider())
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreem(),
    );
  }
}
