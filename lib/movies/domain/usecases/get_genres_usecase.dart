
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetGenresUsecase extends BaseUseCase<List<GenresEntity>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetGenresUsecase({required this.baseMoviesRepository}); 

  @override
  Future<Either<Failure, List<GenresEntity>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getGenres();
  }
}