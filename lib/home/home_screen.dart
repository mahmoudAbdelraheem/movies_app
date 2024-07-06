import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/home/cubit/home_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies/movies_events.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app/movies/presentation/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: [
              //? screen 1
              BlocProvider(
                create: (context) => sl<MoviesBloc>()
                  ..add(GetNowPlayingMoviesEvent())
                  ..add(GetPopularMoviesEvent())
                  ..add(GetTopRatedMoviesEvent()),
                child: MoviesScreen(),
              ),
              //? screen 2
              // todo implement search screen
              SearchScreen(),
              // todo implement watch list screen
              // Center(
              //   child: Text('Search Screen'),
              // ),
              Center(
                child: Text('watch list Screen'),
              ),
              //? screen 3
              //? screen 4
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => context.read<HomeCubit>().setSelectedIndex(index),
            type: BottomNavigationBarType.fixed,
            // backgroundColor: const Color.fromARGB(255, 19, 19, 26),
            backgroundColor: AppColors.appBarColor,
            selectedItemColor: AppColors.goldColor,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter_outlined),
                label: 'Movies',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.person),
              //   label: 'Profile',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.favorite),
              //   label: 'Favorite',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Watch List',
              ),
            ],
          ),
        );
      },
    );
  }
}
