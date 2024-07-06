import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/shared/custom_loading_widget.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/search/movies_cateogires_items.dart';
import 'package:movies_app/movies/presentation/widgets/see_more/movie_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => SearchBloc(
        getGenresUsecase: sl(),
        getMoviesByGenresIdUsecase: sl(),
        getMoviesBySearchQuaryUsecase: sl(),
      )..add(GetAllCategoriesEvent()),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return SafeArea(
            child: Container(
              color: AppColors.secondaryColor,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomTextFormField(
                      myHintText: 'Search',
                      myController: searchController,
                      myIcon: Icons.search,
                      keyboardType: TextInputType.text,
                      myValidator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid search';
                        } else {
                          return null;
                        }
                      },
                      onPressed: () {
                        context.read<SearchBloc>().add(
                              SearchByMoviesQueryEvent(
                                query: searchController.text,
                              ),
                            );
                      },
                    ),
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is GetAllCategoriesSuccessState ||
                          (state is SearchSuccessState &&
                              state.showCategories)) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 7),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Search By Categories',
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            MoviesCategoriesItems(
                              categories: state is GetAllCategoriesSuccessState
                                  ? state.categories
                                  : (state as SearchSuccessState).categories,
                            ),
                          ],
                        );
                      } else if (state is GetAllCategoriesLoadingState) {
                        return CustomLoadingWidget();
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchSuccessState) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return MovieCardWidget(
                              size: screenSize,
                              movie: state.movies[index],
                            );
                          },
                          itemCount: state.movies.length,
                        );
                      } else if (state is SearchLoadingState) {
                        return CustomLoadingWidget();
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
