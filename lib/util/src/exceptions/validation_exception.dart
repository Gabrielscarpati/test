class ValidationException implements Exception {
  String title;
  String message;

  ValidationException({required this.title, required this.message});
}
