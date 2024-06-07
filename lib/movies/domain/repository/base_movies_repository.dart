import 'package:movies_app/movies/domain/entities/movie_entity.dart';

abstract class BaseMoviesRepository {
  Future<List<MovieEntity>> getNowPlayingMovies();

  Future<List<MovieEntity>> getPobularMovies();

  Future<List<MovieEntity>> getTopRatedMovies();
}
