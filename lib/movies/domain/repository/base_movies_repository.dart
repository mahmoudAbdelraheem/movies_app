import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_movies.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

//? get movie details based on movie ID
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      {required MovieDetailsParametar parameters});

//? get recommndation based on movie details ID
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendationMovies({
    required RecommendationParameters parameters,
  });

  //? get genres
  Future<Either<Failure, List<GenresEntity>>> getGenres();

  //? get movies by genre id
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenreId({required String genreId});

  //? get movies by search query
  Future<Either<Failure, List<MovieEntity>>> getMoviesBySearchQuery({required String query});
}
