part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

//? search on movies using query (movie  name)
final class SearchByMoviesQueryEvent extends SearchEvent {
  final String query;

  SearchByMoviesQueryEvent({required this.query});
    @override
  List<Object> get props => [query];
}


//? search on movies using category (category id)
final class SearchByMoviesCategoryEvent extends SearchEvent {
  final String categoryID;  

  SearchByMoviesCategoryEvent({required this.categoryID});
    @override
  List<Object> get props => [categoryID];
}

//? get all categories for search
final class GetAllCategoriesEvent extends SearchEvent {
  @override
  List<Object> get props => [];
}

