class BadRequestException implements Exception {
  String title;
  String message;

  BadRequestException({required this.title, required this.message});
}
