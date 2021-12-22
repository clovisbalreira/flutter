import 'package:aap_filmes/models/movie_detail_model.dart';
import 'package:aap_filmes/models/movie_model.dart';

abstract class MoviesService {
  Future<List<MovieModel>> getPopulaMovies();
  Future<List<MovieModel>> getTopMovies();
  Future<MovieDetailModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId,MovieModel movie);
  Future<List<MovieModel>> getFavoritiesMovies(String userId);
}
