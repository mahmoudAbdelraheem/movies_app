import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  //? to get now playing movies
  final NowPlayingMoviesUsecase nowPlayingMoviesUsecase;
  MoviesBloc({required this.nowPlayingMoviesUsecase})
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await nowPlayingMoviesUsecase.execute();
      print(result);
    });
  }
}
