import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class LocalDataBaseFaliure extends Failure {
  const LocalDataBaseFaliure({required super.message});
}

class GeneralFailure extends Failure {
  const GeneralFailure({required super.message});
}
