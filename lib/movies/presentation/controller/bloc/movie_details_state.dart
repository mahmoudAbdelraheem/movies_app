// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  //?
  final List<RecommendationEntity> recommendation;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    //?
    this.recommendation = const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    //?
    List<RecommendationEntity>? recommendation,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      //?
      recommendation: recommendation ?? this.recommendation,
      recommendationRequestState:
          recommendationRequestState ?? this.recommendationRequestState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsRequestState,
        movieDetailsMessage,
        //?
        recommendation,
        recommendationRequestState,
        recommendationMessage,
      ];
}
