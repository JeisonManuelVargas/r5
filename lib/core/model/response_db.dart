class ResponseDB {
  bool isSuccess;
  String message;
  dynamic result;

  ResponseDB({
    required this.result,
    required this.message,
    required this.isSuccess,
  });

  dynamic get response => result;
}
