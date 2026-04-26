import 'package:dio/dio.dart';

abstract class BaseApiService {
  const BaseApiService(this.dio);

  final Dio dio;
}
