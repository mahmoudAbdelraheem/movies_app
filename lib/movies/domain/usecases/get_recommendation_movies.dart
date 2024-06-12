// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failure.dart';

import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationMovies extends BaseUseCase<List<RecommendationEntity>,RecommendationParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationMovies({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(RecommendationParameters parameters) async{
    return await baseMoviesRepository.getRecommendationMovies(parameters: parameters);
  }

}

class RecommendationParameters extends Equatable {
  final int movieID;

  const RecommendationParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}
