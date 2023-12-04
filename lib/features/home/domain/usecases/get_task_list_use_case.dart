import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/base/base_usecase.dart';
import 'package:r5/core/model/task_model.dart';
import 'package:r5/features/home/domain/repositories/home_auth_repository.dart';

class GetTaskListUseCase extends BaseUseCase<List<TaskModel>, GetTaskListParams> {
  GetTaskListUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<TaskModel>>> call(GetTaskListParams params) =>
      homeRepository.getListTask(
        skip: params.skip,
        limit: params.limit,
      );
}

class GetTaskListParams {
  GetTaskListParams({
    required this.limit,
    required this.skip,
  });

  final int limit;
  final int skip;
}
