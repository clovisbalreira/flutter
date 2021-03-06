import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vakinha_burger_mobile/app/routes/splash_routes.dart';

void main() {
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      getPages: [
        ...SplashRouters.routers,
      ],
    );
  }
}
