import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/auth/data/datasource/auth_remote_darasource.dart';
import 'package:movies_app/auth/data/repository/auth_repository.dart';
import 'package:movies_app/auth/domain/repository/base_auth_repository.dart';
import 'package:movies_app/auth/domain/usecases/logout_usecase.dart';
import 'package:movies_app/auth/domain/usecases/signin_usecse.dart';
import 'package:movies_app/auth/domain/usecases/signup_usecase.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_genres_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_by_genres_id.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_by_search_quary.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_movies.dart';
import 'package:movies_app/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_bloc.dart';

//? sl => service locator
final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
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
    
    //? movies home bloc
    sl.registerLazySingleton(
      () => MoviesBloc(
        nowPlayingMoviesUsecase: sl(),
        popularMoviesUsecase: sl(),
        topRatedMoviesUsecase: sl(),
      ),
    );

    //! USERCASES

    //? auth usecases
    sl.registerLazySingleton(() => SigninUsecse(baseAuthRepository: sl()));
    sl.registerLazySingleton(() => SignupUsecase(baseAuthRepository: sl()));
    sl.registerLazySingleton(() => LogoutUsecase(baseAuthRepository: sl()));

    //? home page usecases
    sl.registerLazySingleton(
        () => NowPlayingMoviesUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => PopularMoviesUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => TopRatedMoviesUsecase(baseMoviesRepository: sl()));
    //? movie details usecase
    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetRecommendationMoviesUseCase(baseMoviesRepository: sl()));

    //? search usecase
  sl.registerLazySingleton(
    ()=> GetGenresUsecase( baseMoviesRepository: sl()),
  );
  sl.registerLazySingleton(()=> GetMoviesByGenresIdUsecase(baseMoviesRepository: sl()));
  sl.registerLazySingleton(()=> GetMoviesBySearchQuaryUsecase(baseMoviesRepository: sl()));
    //! REPOSITORY
    //? auth repository
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(remoteDataSource: sl()));
    //? movie repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMoviesRemoteDataSource: sl()));

    //! DATA SOURCE
    //? auth data source
    sl.registerLazySingleton<AuthRemoteDarasource>(
      () => AuthRemoteDatasourceImpl(),
    );
    //? movie data source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());


        //? search data source
       
  }
}
