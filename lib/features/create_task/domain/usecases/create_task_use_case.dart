import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/base/base_usecase.dart';
import 'package:r5/core/model/user_model.dart';
import 'package:r5/features/create_task/domain/repositories/create_task_repository.dart';

class CreateTaskUseCase extends BaseUseCase<UserModel?, UserModel> {
  CreateTaskUseCase({required this.registerRepository});

  final CreateTaskRepository registerRepository;

  @override
  Future<Either<Failure, UserModel?>> call(UserModel params) =>
      registerRepository.registerWithEmailAndPassword(userModel: params);
}
