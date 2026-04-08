import 'package:aap_filmes/application/modules/modules.dart';
import 'package:aap_filmes/application/modules/splash/splash_bindings.dart';
import 'package:get/get.dart';
import 'splash_page.dart';

class SplashModule implements Module{
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/', 
      page: () => SplashPage(),
      binding: SplashBindings(),
      )
  ];
}