import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class PopularMoviesUsecase{

  final BaseMoviesRepository baseMoviesRepository;

  PopularMoviesUsecase({required this.baseMoviesRepository});

  Future <List<MovieEntity>> execute()async{
    return await baseMoviesRepository.getPobularMovies();
  }
}