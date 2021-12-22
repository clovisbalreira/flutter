import 'package:aap_filmes/application/repositories/movies/movies_repository.dart';
import 'package:aap_filmes/application/services/movies/movies_service.dart';
import 'package:aap_filmes/models/movie_detail_model.dart';
import 'package:aap_filmes/models/movie_model.dart';

class MoviesServiceImpl implements MoviesService{

  final MoviesRepository _moviesRepository;
  MoviesServiceImpl({required MoviesRepository moviesRepository}) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopulaMovies() => _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopMovies() => _moviesRepository.getTopRated();

  @override
  Future<MovieDetailModel?> getDetail(int id) => _moviesRepository.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) => _moviesRepository.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) => _moviesRepository.getFavoritiesMovies(userId);
}
