import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_movies.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_details/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getRecommendationMoviesUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMovieEevent>(_getRecommendationMovies);
  }

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParametar(movieID: event.id));

    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsRequestState: RequestState.error,
          movieDetailsMessage: failure.message,
        ),
      ),
      (movieDetails) => emit(
        state.copyWith(
          movieDetailsRequestState: RequestState.loaded,
          movieDetails: movieDetails,
        ),
      ),
    );
  }

  Future<void> _getRecommendationMovies(GetRecommendationMovieEevent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMoviesUseCase(
        RecommendationParameters(movieID: event.id));
    
    result.fold(
      (failure) => emit(
        state.copyWith(
          recommendationRequestState: RequestState.error,
          recommendationMessage: failure.message,
        ),
      ),
      (recommendations) => emit(
        state.copyWith(
          recommendationRequestState: RequestState.loaded,
          recommendation: recommendations,
        ),
      ),
    );
  }
}
