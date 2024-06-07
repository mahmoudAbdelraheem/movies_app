import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class TopRatedMoviesUsecase {
  final BaseMoviesRepository baseMoviesRepository;

  TopRatedMoviesUsecase({required this.baseMoviesRepository});

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
