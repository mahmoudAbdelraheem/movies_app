import 'package:dartz/dartz.dart';
import 'package:movies_app/auth/domain/entities/user_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';

abstract class BaseAuthRepository {
  //? sign in
  Future<Either<Failure, UserEntity>> signIn(AuthParameter parameters);
  //? sign up
  Future<Either<Failure, UserEntity>> signUp(AuthParameter parameters);
  //? sign out
  Future<Either<Failure, void>> signOut();
  //? get current user data
  Future<Either<Failure, UserEntity>> getCurrentUser();

}
