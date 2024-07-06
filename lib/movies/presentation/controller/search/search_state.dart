part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<MovieEntity> movies;  

  SearchSuccessState({required this.movies});
  @override
  List<Object> get props => [movies];
}


final class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({required this.message});
   @override
  List<Object> get props => [message];
}

//? for _getAllCategories
final class GetAllCategoriesLoadingState extends SearchState {}

final class GetAllCategoriesSuccessState extends SearchState {
  final List<GenresEntity> categories;
  GetAllCategoriesSuccessState({required this.categories});
  @override
  List<Object> get props => [categories];
}
final class GetAllCategoriesErrorState extends SearchState {
  final String message;
  GetAllCategoriesErrorState({required this.message});
  @override
  List<Object> get props => [message];
}