import 'package:dio/dio.dart';
import 'package:flutter_challenge/src/core/constants.dart';

class ApiClient {
  static late Dio? _dio;

  static Dio get dio => _dio ??= Dio(BaseOptions(baseUrl: Constants.BASE_URL));
}
