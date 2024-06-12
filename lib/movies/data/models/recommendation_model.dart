import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({
    required super.backdropPath,
    required super.id,
    required super.title,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path'],
        id: json['title'],
        title: json['id'],
      );
}
