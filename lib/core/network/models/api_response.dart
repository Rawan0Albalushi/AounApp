class ApiResponse<T> {
  const ApiResponse({
    required this.data,
    this.message,
    this.statusCode,
    this.meta,
  });

  final T data;
  final String? message;
  final int? statusCode;
  final Map<String, dynamic>? meta;
}
