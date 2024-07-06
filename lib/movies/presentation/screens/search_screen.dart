import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/shared/custom_loading_widget.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';

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
    return BlocProvider(
      create: (context) => SearchBloc(
        getGenresUsecase: sl(),
        getMoviesByGenresIdUsecase: sl(),
        getMoviesBySearchQuaryUsecase: sl(),
      )..add(GetAllCategoriesEvent()),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
            if(state is SearchSuccessState){
                print(state.movies[0].title);
            }
        },
        builder: (context, state) {
          return SafeArea(
            child: Container(
              color: AppColors.secondaryColor,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    myHintText: 'Search',
                    myController: searchController,
                    myIcon: Icons.search,
                    keyboardType: TextInputType.text,
                    myValidator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter a valid search';
                      } else {
                        return null;
                      }
                    },
                    onPressed: () {
                      //todo implement start search
                      context.read<SearchBloc>().add(
                            SearchByMoviesQueryEvent(
                              query: searchController.text,
                            ),
                          );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 7),
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
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is GetAllCategoriesSuccessState) {
                        return SizedBox(
                          height: 40,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  //todo implement start search using category id
                                  context.read<SearchBloc>().add(
                                        SearchByMoviesCategoryEvent(
                                          categoryID: state.categories[index].id
                                              .toString(),
                                        ),
                                      );
                                  print(state.categories[index].id);
                                },
                                child: Chip(
                                  label: Text(state.categories[index].name),
                                ),
                              ),
                            ),
                            itemCount: state.categories.length,
                          ),
                        );
                      } else if (state is GetAllCategoriesErrorState) {
                        return Text(state.message);
                      } else if (state is GetAllCategoriesLoadingState) {
                        return const Center(child: CustomLoadingWidget());
                      }

                      return const SizedBox();
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
