import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';
import 'package:movies_app/movies/presentation/widgets/home/now_playing_widget.dart';
import 'package:movies_app/movies/presentation/widgets/home/popular_widget.dart';
import 'package:movies_app/movies/presentation/widgets/home/top_rated_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MoviesBloc, MoviesStates>(builder: (context, state) {
          return SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingWidget(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO POPULAR SCREEN
                          Navigator.pushNamed(
                              context, AppConstance.seeMoreScreen, arguments: {
                            'title': 'POPULAR MOVIES',
                            'movies': state.popularMovies
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('See More'),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularWidget(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO Top Rated Movies Screen
                          Navigator.pushNamed(
                              context, AppConstance.seeMoreScreen, arguments: {
                            'title': 'TOP RATED MOVIES',
                            'movies': state.topRatedMovies
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('See More'),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedWidget(),
                const SizedBox(height: 50.0),
              ],
            ),
          );
        }),
      ),
    );
  }
}
