import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String packdropPath;
  final List<int> genreIds;
  final String overView;
  final double voteAvarage;
  final String releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.packdropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAvarage,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      packdropPath,
      posterPath,
      genreIds,
      overView,
      voteAvarage,
      releaseDate,
    ];
  }
}
