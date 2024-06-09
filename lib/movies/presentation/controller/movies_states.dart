import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MoviesStates extends Equatable {
  //? now playing
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;
  //? popular
  final List<MovieEntity> popularMovies;
  final RequestState popularRequestState;
  final String popularMessage;
  //? top rated
  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedRequestState;
  final String topRatedMessage;

  const MoviesStates({
    //?
    this.nowPlayingMovies = const [],
    this.nowPlayingRequestState = RequestState.loading,
    this.nowPlayingMessage = '',
    //?
    this.popularMovies = const [],
    this.popularRequestState = RequestState.loading,
    this.popularMessage = '',
    //?
    this.topRatedMovies = const [],
    this.topRatedRequestState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MoviesStates copyWith({
    //? now playing
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingRequestState,
    String? nowPlayingMessage,
    //? popular
    List<MovieEntity>? popularMovies,
    RequestState? popularRequestState,
    String? popularMessage,
    //? top rated
    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedRequestState,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      //?
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingRequestState:
          nowPlayingRequestState ?? this.nowPlayingRequestState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      //?
      popularMovies: popularMovies ?? this.popularMovies,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      popularMessage: popularMessage ?? this.popularMessage,
      //?
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingRequestState,
        nowPlayingMessage,
        //?
        popularMovies,
        popularRequestState,
        popularMessage,
        //?
        topRatedMovies,
        topRatedRequestState,
        topRatedMessage,
      ];
}










// sealed class MoviesStates extends Equatable {
//   const MoviesStates();
//   @override
//   List<Object> get props => [];
// }

// class MoviesInitialState extends MoviesStates{}

// class NowPlayingMoviesStates extends Equatable {
//   //? now playing
//   final List<MovieEntity> nowPlayingMovies;
//   final RequestState nowPlayingRequestState;
//   final String nowPlayingMessage;

//   const NowPlayingMoviesStates({
//     //?
//     this.nowPlayingMovies = const [],
//     this.nowPlayingRequestState = RequestState.loading,
//     this.nowPlayingMessage = '',
//   });

//   @override
//   List<Object> get props => [
//         nowPlayingMovies,
//         nowPlayingRequestState,
//         nowPlayingMessage,
//       ];
// }

// class PopularMoviesStates extends Equatable {
//   //? popular
//   final List<MovieEntity> popularMovies;
//   final RequestState popularRequestState;
//   final String popularMessage;

//   const PopularMoviesStates({
//     //?
//     this.popularMovies = const [],
//     this.popularRequestState = RequestState.loading,
//     this.popularMessage = '',
//   });

//   @override
//   List<Object> get props => [
//         //?
//         popularMovies,
//         popularRequestState,
//         popularMessage,
//       ];
// }

// class TopRateMoviesStates extends Equatable {
//   //? top rated
//   final List<MovieEntity> topRatedMovies;
//   final RequestState topRatedRequestState;
//   final String topRatedMessage;

//   const TopRateMoviesStates({
//     //?
//     this.topRatedMovies = const [],
//     this.topRatedRequestState = RequestState.loading,
//     this.topRatedMessage = '',
//   });

//   @override
//   List<Object> get props => [
//         //?
//         topRatedMovies,
//         topRatedRequestState,
//         topRatedMessage,
//       ];
// }


