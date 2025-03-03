import 'package:aap_filmes/application/login/login_module.dart';
import 'package:aap_filmes/application/modules/home/home_module.dart';
import 'package:aap_filmes/application/modules/movie_detail/movie_detail_module.dart';
import 'package:aap_filmes/application/modules/splash/splash_module.dart';
import 'package:aap_filmes/application/ui/filmes_app_ui_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'application/bindings/aplication_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: FilmesAppUiConfig.title,
      initialBinding: AplicationBindings(),
      theme: FilmesAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers
      ],
    );
  }
}

