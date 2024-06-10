import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overView;
  final double voteAvarage;
  final String releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
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
      backdropPath,
      genreIds,
      overView,
      voteAvarage,
      releaseDate,
    ];
  }
}
