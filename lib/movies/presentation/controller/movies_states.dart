// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MoviesStates extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingRequestState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingRequestState,
        nowPlayingMessage,
      ];
}
