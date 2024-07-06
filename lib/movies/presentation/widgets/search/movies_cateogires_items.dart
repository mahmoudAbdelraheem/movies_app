import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';
import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';

class MoviesCategoriesItems extends StatelessWidget {
  final List<GenresEntity> categories;
  const MoviesCategoriesItems({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {
              context.read<SearchBloc>().add(
                    SearchByMoviesCategoryEvent(
                      categoryID: categories[index].id.toString(),
                    ),
                  );
            },
            child: Chip(
              label: Text(categories[index].name),
            ),
          ),
        ),
        itemCount: categories.length,
      ),
    );
  }
}
