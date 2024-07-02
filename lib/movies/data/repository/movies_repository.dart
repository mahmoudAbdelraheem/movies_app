import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_movies.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository({required this.baseMoviesRemoteDataSource});

  Future<Either<Failure, List<MovieEntity>>> _getMovies(
    Future<List<MovieEntity>> Function() getMoviesFunction,
  ) async {
    try {
      final result = await getMoviesFunction();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    return await _getMovies(baseMoviesRemoteDataSource.getNowPlayingMovies);
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    return await _getMovies(baseMoviesRemoteDataSource.getPopularMovies);
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    return await _getMovies(baseMoviesRemoteDataSource.getTopRatedMovies);
  }

Future<Either<Failure, T>> _execute<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      {required MovieDetailsParametar parameters}) {
    return _execute(
        () => baseMoviesRemoteDataSource.getMovieDetails(parameters));
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendationMovies(
      {required RecommendationParameters parameters}) {
    return _execute(
        () => baseMoviesRemoteDataSource.getRecommendationMovies(parameters));
  }

}
