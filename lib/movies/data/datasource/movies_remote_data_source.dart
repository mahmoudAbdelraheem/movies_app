import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/apis_config.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MoviesRemoteDataSource implements BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() {
    return _fetchMovies(ApisConfig.nowPlayingMovieUrl);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    return _fetchMovies(ApisConfig.popularMovieUrl);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    return _fetchMovies(ApisConfig.topRatedMovieUrl);
  }

  Future<List<MovieModel>> _fetchMovies(String url) async {
    final Dio dio = Dio();
    
      final Response<dynamic> response = await dio.get(url);
      if (response.statusCode == 200) {
        List<MovieModel> movies = [];
        List<dynamic> responseList = response.data['results'];
        movies.addAll(responseList.map((movie) => MovieModel.fromJson(movie)));
        return movies;
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
  }
}
