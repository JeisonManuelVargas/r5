import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/task_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<TaskModel>>> getListTask({
    required int limit,
    required int skip,
  });
}
