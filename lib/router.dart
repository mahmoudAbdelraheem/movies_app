import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:movies_app/auth/presentation/screens/signin_screen.dart';
import 'package:movies_app/auth/presentation/screens/signup_screen.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/home/cubit/home_cubit.dart';
import 'package:movies_app/home/home_screen.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_event.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/movies/presentation/screens/see_more_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppConstance.homeScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeScreen(),
        ),
      );

    case AppConstance.loginScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BlocProvider(
          create: (context) => AuthBloc(
            logoutUsecase: sl(),
            signinUsecse: sl(),
            signupUsecse: sl(),
          ),
          child: const SigninScreen(),
        ),
      );

    case AppConstance.signupScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BlocProvider(
          create: (context) => AuthBloc(
            logoutUsecase: sl(),
            signinUsecse: sl(),
            signupUsecse: sl(),
          ),
          child: const SignupScreen(),
        ),
      );

    case AppConstance.movieDetailsScreen:
      int movieID = routeSettings.arguments as int;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BlocProvider(
          create: (context) => MovieDetailsBloc(
            getMovieDetailsUseCase: sl(),
            getRecommendationMoviesUseCase: sl(),
          )
            ..add(GetRecommendationMovieEevent(id: movieID))
            ..add(GetMovieDetailsEvent(id: movieID)),
          child: MovieDetailScreen(id: movieID),
        ),
      );

    case AppConstance.seeMoreScreen:
      Map<String, dynamic> arguments =
          routeSettings.arguments as Map<String, dynamic>;
      String title = arguments['title'] as String;
      List<MovieEntity> movies = arguments['movies'] as List<MovieEntity>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SeeMoreScreen(
          title: title,
          movies: movies,
        ),
      );

    //? display an error screen as defualt
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeScreen(),
        ),
      );
  }
}
