class HttpRequestException implements Exception {
  final String? url;
  final int? statusCode;

  HttpRequestException({required this.url, required this.statusCode});

  @override
  String toString() {
    return "HTTP Request Exception: The url \"$url\" returned code $statusCode";
  }
}
