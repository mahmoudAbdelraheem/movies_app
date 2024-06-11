// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsRequestState,
        movieDetailsMessage,
      ];
}
