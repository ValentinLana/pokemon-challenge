class Response {
  final dynamic data;
  final bool isSuccess;
  final String errorMessage;

  Response(
      {required this.data, required this.isSuccess, this.errorMessage = ''});
}
