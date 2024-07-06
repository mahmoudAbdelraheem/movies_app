import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMoviesBySearchQuaryUsecase extends BaseUseCase<List<MovieEntity>, String> {
  final BaseMoviesRepository baseMoviesRepository;  

  GetMoviesBySearchQuaryUsecase({required this.baseMoviesRepository});

  @override 
  Future<Either<Failure, List<MovieEntity>>> call(String query) async{
    return await baseMoviesRepository.getMoviesBySearchQuery(query: query);
  }
}