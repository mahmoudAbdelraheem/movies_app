import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/usecases/get_genres_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_by_genres_id.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_by_search_quary.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetGenresUsecase getGenresUsecase;
  final GetMoviesBySearchQuaryUsecase getMoviesBySearchQuaryUsecase;
  final GetMoviesByGenresIdUsecase getMoviesByGenresIdUsecase;
  SearchBloc({
    required this.getGenresUsecase,
    required this.getMoviesBySearchQuaryUsecase,
    required this.getMoviesByGenresIdUsecase,
  }) : super(SearchInitial()) {
    on<GetAllCategoriesEvent>(_getAllCategories);
    on<SearchByMoviesQueryEvent>(_getMoviesByQuery);
    on<SearchByMoviesCategoryEvent>(_getMoviesByCategoryID);
  }
  final List<GenresEntity> categories = [];
  FutureOr<void> _getAllCategories(
      GetAllCategoriesEvent event, Emitter<SearchState> emit) async {
    emit(GetAllCategoriesLoadingState());
    try {
      final result = await getGenresUsecase.call(NoParameters());
      result.fold((l) => emit(GetAllCategoriesErrorState(message: l.message)),
          (r) {
        categories.addAll(r);
        emit(GetAllCategoriesSuccessState(categories: r));
      });
    } catch (e) {
      return emit(GetAllCategoriesErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _getMoviesByQuery(
      SearchByMoviesQueryEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    try {
      final result = await getMoviesBySearchQuaryUsecase.call(event.query);
      result.fold(
        (l) => emit(SearchErrorState(message: l.message)),
        (r) => emit(
          SearchSuccessState(
            movies: r,
            categories: categories,
            showCategories: true,
          ),
        ),
      );
    } catch (e) {
      return emit(SearchErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _getMoviesByCategoryID(
      SearchByMoviesCategoryEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    try {
      final result = await getMoviesByGenresIdUsecase.call(event.categoryID);
      result.fold(
        (l) => emit(SearchErrorState(message: l.message)),
        (r) => emit(
          SearchSuccessState(
            movies: r,
            categories: categories,
            showCategories: true,
          ),
        ),
      );
    } catch (e) {
      return emit(SearchErrorState(message: e.toString()));
    }
  }
}
