import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details/movie_details_content.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}
