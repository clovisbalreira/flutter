import 'package:aap_filmes/application/auth/auth_service.dart';
import 'package:aap_filmes/application/repositories/login/login_repository.dart';
import 'package:aap_filmes/application/repositories/login/login_repository_impl.dart';
import 'package:aap_filmes/application/repositories/movies/movies_repository.dart';
import 'package:aap_filmes/application/repositories/movies/movies_repository_impl.dart';
import 'package:aap_filmes/application/rest_client/rest_client.dart';
import 'package:aap_filmes/application/services/login/login_service.dart';
import 'package:aap_filmes/application/services/login/login_service_impl.dart';
import 'package:aap_filmes/application/services/movies/movies_service.dart';
import 'package:aap_filmes/application/services/movies/movies_service_impl.dart';
import 'package:get/get.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(),fenix: true);
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(() => LoginServiceImpl(loginRepository: Get.find()), fenix: true);
    Get.put(AuthService()).init();

    Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl(restClient: Get.find()), fenix: true);
    Get.lazyPut<MoviesService>(() => MoviesServiceImpl(moviesRepository: Get.find()), fenix: true);
  }
}
