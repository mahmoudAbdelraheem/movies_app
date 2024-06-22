import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';

class MovieGenresWidget extends StatelessWidget {
  final List<GenresEntity> movieGenres;
  const MovieGenresWidget({super.key, required this.movieGenres});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        'Genres: ${_showGenres(movieGenres)}',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
    String _showGenres(List<GenresEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

}
