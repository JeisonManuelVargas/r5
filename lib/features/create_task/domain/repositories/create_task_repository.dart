import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/task_model.dart';

abstract class CreateTaskRepository {
  Future<Either<Failure, bool>> createTask({
    required TaskModel taskModel
  });
}
