import 'package:flutter/material.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/restaurant/restaurant_screen.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        spacing: 12.0,
        children: [
          Image.asset('assets/${restaurant.imagePath}', width: 96),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(restaurant.name,
              style: TextStyle(
                  fontWeight:
                  FontWeight.bold,
                  fontSize: 16
              ),),
            Row(
              children: List.generate(restaurant.stars.toInt(), (index){
                return Image.asset('assets/others/star.png', width: 16);
              }),
            ),
            Text('${restaurant.distance}Km'),
          ],)
        ],
      ),
    );
  }
}
