import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable{
  const NoParameters();
  @override
  List<Object?> get props => [];
  
}


class MovieDetailsParametar extends Equatable {
  final int movieID;
  const MovieDetailsParametar({required this.movieID});
  @override
  List<Object> get props => [movieID];
}

//? use for user auth parameters with email and password
class AuthParameter extends Equatable {
  final String email;
  final String password;
  const AuthParameter({required this.email, required this.password});
  @override
  List<Object> get props => [email, password];
}