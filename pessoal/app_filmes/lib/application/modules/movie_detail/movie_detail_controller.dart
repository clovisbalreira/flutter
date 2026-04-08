import 'package:aap_filmes/application/services/movies/movies_service.dart';
import 'package:aap_filmes/application/ui/loader/loader_mixin.dart';
import 'package:aap_filmes/application/ui/messages/messages.dart';
import 'package:aap_filmes/models/movie_detail_model.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessgesMixin {
  final MoviesService _moviesService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDetailModel>();

  MovieDetailController({required MoviesService movieService})
      : _moviesService = movieService;

  @override
  void onInit() {
    super.onInit();
    LoaderListener(loading);
    messagesListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesService.getDetail(movieId);
      movie.value = movieDetailData;
      //movie(movieDetailData);
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar o detalhe do filme'));
    }
  }
}
