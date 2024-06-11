import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overView,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAvarage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(
        json['genres'].map((e) => GenresModel.fromJson(e)),
      ),
      id: json['id'],
      overView: json['overview'],
      releaseDate: json['release_date'],
      runTime: json['runtime'],
      title: json['title'],
      voteAvarage: json['vote_average'],
    );
  }
}
