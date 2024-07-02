import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/auth/domain/entities/user_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';

abstract class AuthRemoteDarasource {
  Future<Either<Failure, UserEntity>> signIn(AuthParameter parameters);
  Future<Either<Failure, UserEntity>> signUp(AuthParameter parameters);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity>> getCurrentUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDarasource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, UserEntity>> signIn(AuthParameter parameters)async {
      try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: parameters.email,
        password: parameters.password,
      );
      return  Right(UserEntity(uid: user.user!.uid, password: parameters.password, email: parameters.email)); // Return success without a value (void)
    } catch (e) {
      return Left(ServerFailure(message: e.toString())); // Return failure with error message
    }

  }

  @override
  Future<Either<Failure, UserEntity>> signUp(AuthParameter parameters) async{
   try {
    UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
       email: parameters.email,
       password: parameters.password,
     );
     return  Right(UserEntity(uid: user.user!.uid, password: parameters.password, email: parameters.email));
   }catch (e) {
     return Left(ServerFailure(message: e.toString()));
   }
  }

  @override
  Future<Either<Failure, void>> signOut()async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    }catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser()async { 
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        return Right(UserEntity(uid: user.uid, email: user.email!, password: ''));
      } else {
        return Left(ServerFailure(message: 'No user logged in'));
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  
  }
}