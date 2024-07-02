import 'package:dartz/dartz.dart';
import 'package:movies_app/auth/data/datasource/auth_remote_darasource.dart';
import 'package:movies_app/auth/domain/entities/user_entity.dart';
import 'package:movies_app/auth/domain/repository/base_auth_repository.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';

class AuthRepository implements BaseAuthRepository {
  final AuthRemoteDarasource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final result = await remoteDataSource.getCurrentUser();
      return result;
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(AuthParameter parameters) async {
    try {
      final result = await remoteDataSource.signIn(parameters);
      return result;
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await remoteDataSource.signOut();
      return result;
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(AuthParameter parameters) async {
    try {
      final result = await remoteDataSource.signUp(parameters);
      return result;
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
