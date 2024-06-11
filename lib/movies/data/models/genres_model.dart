import 'package:movies_app/movies/domain/entities/genres_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({
    required super.name,
    required super.id,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(name: json['name'], id: json['id']);
  }
}
