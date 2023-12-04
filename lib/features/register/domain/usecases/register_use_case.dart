import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/base/base_usecase.dart';
import 'package:r5/core/model/user_model.dart';
import 'package:r5/features/register/domain/repositories/social_auth_repository.dart';

class RegisterUseCase extends BaseUseCase<UserModel?, UserModel> {
  RegisterUseCase({required this.registerRepository});

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, UserModel?>> call(UserModel params) =>
      registerRepository.registerWithEmailAndPassword(userModel: params);
}
