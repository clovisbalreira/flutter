import 'package:aap_filmes/application/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
