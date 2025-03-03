import 'package:aap_filmes/application/modules/movies/movies_controller.dart';
import 'package:aap_filmes/application/repositories/genres/genres_repository.dart';
import 'package:aap_filmes/application/repositories/genres/genres_repository_impl.dart';
import 'package:aap_filmes/application/services/genres/genres_service._impl.dart';
import 'package:aap_filmes/application/services/genres/genres_service.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<GenresService>(
      () => GenresServiceImpl(genresRepository: Get.find()));
    Get.lazyPut(() => MoviesController(genresService: Get.find(),moviesService: Get.find(),authService: Get.find()));
  }
}
