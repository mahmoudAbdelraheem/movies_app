import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MovieDateWidget extends StatelessWidget {
  const MovieDateWidget({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 130,
      child: SizedBox(
        height: 200,
        width: size.width - 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? movie name
              SizedBox(
                width: size.width - 180,
                child: Text(
                  movie.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
              //? relese data , rate
              Row(
                children: [
                  Card(
                    color: AppColors.redColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        movie.releaseDate.split('-')[0],
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: AppColors.goldColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    movie.voteAvarage.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              //? movie over view

              SizedBox(
                width: size.width - 180,
                child: Text(
                  movie.overView,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
