import 'package:aap_filmes/application/auth/auth_service.dart';
import 'package:aap_filmes/application/services/genres/genres_service.dart';
import 'package:aap_filmes/application/services/movies/movies_service.dart';
import 'package:aap_filmes/application/ui/messages/messages.dart';
import 'package:aap_filmes/models/genre_model.dart';
import 'package:aap_filmes/models/movie_model.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController with MessgesMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenreModel>[].obs;

  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;

  var _popularMoviesOriginal = <MovieModel>[];
  var _topRatedMovieOriginal = <MovieModel>[];

  final genreSelected = Rxn<GenreModel>();

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    messagesListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      getMovies();
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(title: 'Erro', message: 'Erro ao carregar'));
    }
  }

  void getMovies() async {
    try {
      var popularMoviesData = await _moviesService.getPopulaMovies();
      var topRatedMoviesData = await _moviesService.getTopMovies();
      final favorites = await getFavorites();

      popularMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      });

      topRatedMoviesData.map((m) {
        if (favorites.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      });

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;
      topRatedMovies.assignAll(topRatedMoviesData);
      _topRatedMovieOriginal = topRatedMoviesData;
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(title: 'Erro', message: 'Erro ao carregar'));
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      var newToRatedMovies = _topRatedMovieOriginal.where((movie) {
        return movie.title.toLowerCase().contains(title.toLowerCase());
      });

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newToRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMovieOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    var genreFilter = genreModel;

    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }

    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newPopularMovies = _popularMoviesOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });

      var newToRatedMovies = _topRatedMovieOriginal.where((movie) {
        return movie.genres.contains(genreFilter?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newToRatedMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRatedMovies.assignAll(_topRatedMovieOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesService.addOrRemoveFavorite(user.uid, newMovie);
      getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorites() async {
    var user = _authService.user;
    if (user != null) {
      final favorites = await _moviesService.getFavoritiesMovies(user.uid);
      return <int, MovieModel>{
        for (var fav in favorites) fav.id: fav,
      };
    }
    return {};
  }
}
