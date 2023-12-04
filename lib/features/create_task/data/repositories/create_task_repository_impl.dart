import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/exceptions.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/user_model.dart';
import 'package:r5/features/create_task/data/data_sources/create_task_data_source.dart';
import 'package:r5/features/create_task/domain/repositories/create_task_repository.dart';

class CreateTaskRepositoryImpl implements CreateTaskRepository {
  CreateTaskRepositoryImpl({required this.registerDataSource});

  final CreateTaskDataSource registerDataSource;


  @override
  Future<Either<Failure, UserModel?>> registerWithEmailAndPassword({
    required UserModel userModel
  }) async {
    try {
      final result = await registerDataSource.registerWithEmailAndPassword(
        userModel: userModel,
      );
      return Right(result);
    } on CreateTaskException catch (e) {
      return Left(CreateTaskFailure(code: e.code));
    }
  }

}
