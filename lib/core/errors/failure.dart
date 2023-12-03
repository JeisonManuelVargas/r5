abstract class Failure {}

class DetailMovieFailure implements Failure {
  final String code;

  DetailMovieFailure({required this.code});
}

class HomeFailure implements Failure {
  final String code;

  HomeFailure({required this.code});
}
