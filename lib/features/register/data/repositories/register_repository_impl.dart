import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/errors/exceptions.dart';
import 'package:r5/core/model/user_model.dart';
import 'package:r5/features/register/data/data_sources/register_data_source.dart';
import 'package:r5/features/register/domain/repositories/social_auth_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({required this.registerDataSource});

  final RegisterDataSource registerDataSource;


  @override
  Future<Either<Failure, UserModel?>> registerWithEmailAndPassword({
    required UserModel userModel
  }) async {
    try {
      final result = await registerDataSource.registerWithEmailAndPassword(
        userModel: userModel,
      );
      return Right(result);
    } on RegisterException catch (e) {
      return Left(RegisterFailure(code: e.code));
    }
  }

}
