import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParametar> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      MovieDetailsParametar parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters: parameters);
  }
}
