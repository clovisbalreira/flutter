import 'package:aap_filmes/application/login/login_binding.dart';
import 'package:aap_filmes/application/login/login_page.dart';
import 'package:aap_filmes/application/modules/modules.dart';
import 'package:get/get.dart';

class LoginModule implements Module{
  @override 
  List<GetPage> routers = [
    GetPage(
      name: '/login', 
      page: () => LoginPage(),
      binding: LoginBindings()
      )
  ];
}