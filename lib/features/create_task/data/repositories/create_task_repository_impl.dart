import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/task_model.dart';
import 'package:r5/core/errors/exceptions.dart';
import 'package:r5/features/create_task/data/data_sources/create_task_data_source.dart';
import 'package:r5/features/create_task/domain/repositories/create_task_repository.dart';

class CreateTaskRepositoryImpl implements CreateTaskRepository {
  CreateTaskRepositoryImpl({required this.createTaskDataSource});

  final CreateTaskDataSource createTaskDataSource;


  @override
  Future<Either<Failure, bool>> createTask({
    required TaskModel taskModel
  }) async {
    try {
      final result = await createTaskDataSource.createTask(
        taskModel: taskModel,
      );
      return Right(result);
    } on CreateTaskException catch (e) {
      return Left(CreateTaskFailure(code: e.code));
    }
  }

}
