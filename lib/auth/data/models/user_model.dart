import 'package:movies_app/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.password, required super.email, required super.uid});
}
