import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.packdropPath,
    required super.posterPath,
    required super.genreIds,
    required super.overView,
    required super.voteAvarage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      packdropPath: json['backdrop_path'],
      genreIds: List.from(json['genre_ids'].map((e) => e)),
      overView: json['overview'],
      voteAvarage: json['vote_average'] as double,
      releaseDate: json['release_date'],
    );
  }
}
