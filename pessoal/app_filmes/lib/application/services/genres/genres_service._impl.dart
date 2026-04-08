import 'package:aap_filmes/application/repositories/genres/genres_repository.dart';
import 'package:aap_filmes/application/services/genres/genres_service.dart';
import 'package:aap_filmes/models/genre_model.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  GenresServiceImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
