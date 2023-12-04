import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/user_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserModel?>> registerWithEmailAndPassword({
    required UserModel userModel,
  });
}
