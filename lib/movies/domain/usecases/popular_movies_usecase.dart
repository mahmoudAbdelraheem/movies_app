import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class PopularMoviesUsecase extends BaseUseCase<List<MovieEntity>,NoParameters>{

  final BaseMoviesRepository baseMoviesRepository;

  PopularMoviesUsecase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters parameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }
}