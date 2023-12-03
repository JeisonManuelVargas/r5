class InvalidCredentialException implements Exception {}

class HomeException implements Exception {
  final String code;

  HomeException({required this.code});
}
class DetailMovieException implements Exception {
  final String code;

  DetailMovieException({required this.code});
}
