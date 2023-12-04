import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/user_model.dart';
import 'package:r5/core/base/base_usecase.dart';
import 'package:r5/features/login/domain/repositories/login_repository.dart';

class SignInEmailPasswordUseCase extends BaseUseCase<UserModel, SignInEmailPasswordParams> {
  SignInEmailPasswordUseCase({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, UserModel>> call(SignInEmailPasswordParams params) =>
      loginRepository.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
}

class SignInEmailPasswordParams {
  SignInEmailPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
