class InvalidCredentialException implements Exception {}

class HomeException implements Exception {
  final String code;

  HomeException({required this.code});
}

class DetailMovieException implements Exception {
  final String code;

  DetailMovieException({required this.code});
}

class LoginException implements Exception {
  final String code;

  LoginException({required this.code});
}

class RegisterException implements Exception {
  final String code;

  RegisterException({required this.code});
}
