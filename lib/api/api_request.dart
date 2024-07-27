import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../utils/utils.dart';

class ApiRequest {
  final Dio _dio;
  ApiRequest(this._dio);

  void setupDio() {
    _dio.options.baseUrl = UrlPath.baseUrl;
  }

  Future<Either<DioException, Response>> getRequest(String url) async {
    try {
      final response = await _dio.get(url);
      return right(response);
    } on DioException catch (e) {
      return left(e);
    }
  }
}
