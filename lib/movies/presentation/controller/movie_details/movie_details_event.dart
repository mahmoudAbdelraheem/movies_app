
import 'package:equatable/equatable.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class GetRecommendationMovieEevent extends MovieDetailsEvent {
  final int id;

  const GetRecommendationMovieEevent({required this.id});
  @override
  List<Object> get props => [id];
}
