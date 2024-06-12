import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';

class MovieDetailsEntity extends Equatable {
  final String backdropPath;
  final List<GenresEntity> genres;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAvarage;

  const MovieDetailsEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overView,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAvarage,
  });

  @override
  List<Object> get props {
    return [
      backdropPath,
      genres,
      id,
      overView,
      releaseDate,
      runTime,
      title,
      voteAvarage,
    ];
  }
}
