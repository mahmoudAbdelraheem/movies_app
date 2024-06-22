import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_event.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details/movie_details_content.dart';


class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MovieDetailsBloc(
        getMovieDetailsUseCase: sl(),
        getRecommendationMoviesUseCase: sl(),
      )
        ..add(GetRecommendationMovieEevent(id: id))
        ..add(GetMovieDetailsEvent(id: id)),
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}
