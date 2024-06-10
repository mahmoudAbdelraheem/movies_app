import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  //? to get now playing movies
  final NowPlayingMoviesUsecase nowPlayingMoviesUsecase;
  //? get popular movies
  final PopularMoviesUsecase popularMoviesUsecase;
  //? get top rated movies
  final TopRatedMoviesUsecase topRatedMoviesUsecase;
  MoviesBloc({
    required this.nowPlayingMoviesUsecase,
    required this.popularMoviesUsecase,
    required this.topRatedMoviesUsecase,
  }) : super(const MoviesStates()) {
    //! get playing now movies
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    //! get popular movies
    on<GetPopularMoviesEvent>(_getPopularMovies);

    //! get top rated movies
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await nowPlayingMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingRequestState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingRequestState: RequestState.loaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await popularMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularRequestState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularRequestState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await topRatedMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedRequestState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedRequestState: RequestState.loaded,
          topRatedMovies: r,
        ),
      ),
    );
  }
}
