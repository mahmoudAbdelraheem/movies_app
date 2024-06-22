import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app/movies/presentation/screens/see_more_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppConstance.movieScreen:
      //? provide movie bloc on root of movie screen
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => BlocProvider(
          create: (context) => sl<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
          child: const MoviesScreen(),
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
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Something went wrong pleas try agin'),
          ),
        ),
      );
  }
}
