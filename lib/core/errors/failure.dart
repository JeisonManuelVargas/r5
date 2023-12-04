abstract class Failure {}

class HomeFailure implements Failure {
  final String code;

  HomeFailure({required this.code});
}

class LoginFailure implements Failure {
  final String code;

  LoginFailure({required this.code});
}

class RegisterFailure implements Failure {
  final String code;

  RegisterFailure({required this.code});
}

class CreateTaskFailure implements Failure {
  final String code;

  CreateTaskFailure({required this.code});
}

