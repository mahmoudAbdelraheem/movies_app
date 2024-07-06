import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/widgets/see_more/movie_data_widget.dart';
import 'package:movies_app/movies/presentation/widgets/see_more/movie_date_background.dart';
import 'package:movies_app/movies/presentation/widgets/see_more/movie_image.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppConstance.movieDetailsScreen,
          arguments: movie.id,
        );
      },
      child: Container(
        height: 260,
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const MovieDataBackground(),
            MovieDateWidget(size: size, movie: movie),
            MovieImage(
              packdropPath: movie.packdropPath,
              posterPath: movie.posterPath,
            ),
          ],
        ),
      ),
    );
  }
}
