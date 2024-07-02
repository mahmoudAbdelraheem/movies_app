import 'package:dartz/dartz.dart';
import 'package:movies_app/auth/domain/entities/user_entity.dart';
import 'package:movies_app/auth/domain/repository/base_auth_repository.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';

class GetCurrentUserUsecase extends BaseUseCase<UserEntity, NoParameters> {
  final BaseAuthRepository baseAuthRepository;

  GetCurrentUserUsecase({required this.baseAuthRepository});
  @override
  Future<Either<Failure, UserEntity>> call(NoParameters parameters) async{
    return await baseAuthRepository.getCurrentUser();
  }
  
}