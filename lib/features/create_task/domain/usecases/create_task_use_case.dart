import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/base/base_usecase.dart';
import 'package:r5/core/model/task_model.dart';
import 'package:r5/features/create_task/domain/repositories/create_task_repository.dart';

class CreateTaskUseCase extends BaseUseCase<bool?, TaskModel> {
  CreateTaskUseCase({required this.createTaskRepository});

  final CreateTaskRepository createTaskRepository;

  @override
  Future<Either<Failure, bool?>> call(TaskModel params) =>
      createTaskRepository.createTask(taskModel: params);
}
