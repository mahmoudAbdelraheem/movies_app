import 'package:dartz/dartz.dart';
import 'package:movies_app/auth/domain/repository/base_auth_repository.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';

class LogoutUsecase extends BaseUseCase<void, NoParameters> {
  final BaseAuthRepository baseAuthRepository;
  LogoutUsecase({required this.baseAuthRepository});  

  @override
  Future<Either<Failure, void>> call(NoParameters parameters)async{
    return await baseAuthRepository.signOut();
  }
}