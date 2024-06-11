import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

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

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      {required MovieDetailsParametar parameters}) async {
    try {
      final result =
          await baseMoviesRemoteDataSource.getMovieDetails(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
