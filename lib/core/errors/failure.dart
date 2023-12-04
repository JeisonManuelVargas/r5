abstract class Failure {}

class DetailMovieFailure implements Failure {
  final String code;

  DetailMovieFailure({required this.code});
}

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
