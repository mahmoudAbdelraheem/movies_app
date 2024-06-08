import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MoviesBloc(nowPlayingMoviesUsecase: sl())
          ..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('test'),
            ),
            body: const Center(
              child: Text('Hello'),
            ),
          );
        },
      ),
    );
  }
}
