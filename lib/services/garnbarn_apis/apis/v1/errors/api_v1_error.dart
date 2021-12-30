class ApiV1Error implements Exception {
  final Map<String, String> body;

  ApiV1Error(this.body);
}
