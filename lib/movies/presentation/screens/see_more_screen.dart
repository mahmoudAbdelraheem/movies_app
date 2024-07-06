import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/widgets/see_more/movie_card_widget.dart';

class SeeMoreScreen extends StatelessWidget {
  final String title;
  final List<MovieEntity> movies;
  const SeeMoreScreen({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        title: Text(title.toLowerCase()),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCardWidget(
            size: size,
            movie: movie,
            
          );
        },
      ),
    );
  }
}
