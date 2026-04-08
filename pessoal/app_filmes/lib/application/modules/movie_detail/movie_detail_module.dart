import 'package:aap_filmes/application/modules/movie_detail/movie_detail.page.dart';
import 'package:aap_filmes/application/modules/movie_detail/movie_detail_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../modules.dart';

class MovieDetailModule extends Module{
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail', 
      page: () => MovieDetailPage(),
      binding: MovieDetailBindings()
    )
  ];
}
