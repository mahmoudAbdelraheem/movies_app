import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_movies.dart';
import 'package:movies_app/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

//? sl => service locator
final sl = GetIt.instance;

class ServiceLocator {
  Future<void>  init() async {
   //! Initialize Firebase
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      print("Error initializing Firebase: $e");
      // Optionally handle the error further, e.g., show a user-friendly message or retry.
    }

    //! my Bloc
    sl.registerLazySingleton(
      () => MoviesBloc(
        nowPlayingMoviesUsecase: sl(),
        popularMoviesUsecase: sl(),
        topRatedMoviesUsecase: sl(),
      ),
    );

    //! USERCASES
    sl.registerLazySingleton(
        () => NowPlayingMoviesUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => PopularMoviesUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => TopRatedMoviesUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetRecommendationMoviesUseCase(baseMoviesRepository: sl()));
    //! REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMoviesRemoteDataSource: sl()));

    //! DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
  }
}
