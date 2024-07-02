import 'package:dartz/dartz.dart';
import 'package:movies_app/auth/domain/entities/user_entity.dart';
import 'package:movies_app/auth/domain/repository/base_auth_repository.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';

class SignupUsecase extends BaseUseCase<void, AuthParameter> {
  final BaseAuthRepository baseAuthRepository;

  SignupUsecase({required this.baseAuthRepository});

  Future<Either<Failure, UserEntity>> call(AuthParameter parameters)async{
    return await baseAuthRepository.signUp(parameters);
  }
}