class ApiV1Error implements Exception {
  final int statusCode;
  final Map<String, String> body;

  ApiV1Error(this.statusCode, this.body);
}
