import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/now_playing_movies_usecase.dart';

//? sl => service locator
final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //! USERCASES
    sl.registerLazySingleton(
        () => NowPlayingMoviesUsecase(baseMoviesRepository: sl()));

    //! REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMoviesRemoteDataSource: sl()));

    //! DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
  }
}
