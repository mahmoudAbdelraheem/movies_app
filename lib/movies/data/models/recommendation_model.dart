import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({
    required super.backdropPath,
    required super.id,
  
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['poster_path'],
        id: json['id'],
        
      );
}
