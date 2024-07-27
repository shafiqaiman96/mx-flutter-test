import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../api/api.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ProductRepository {
  final ApiRequest _apiRequest;

  ProductRepository(this._apiRequest);

  Future<Either<ApiRequestFailure, ApiRequestSuccess>>
      fetchProductList() async {
    final response = await _apiRequest.getRequest(UrlPath.products);

    return await response.fold((failure) {
      if (failure.error == DioException.connectionTimeout ||
          failure.error == DioException.receiveTimeout ||
          failure.error == DioException.sendTimeout) {
        return left(ApiRequestFailure.connectionTimeout());
      } else {
        return left(
          ApiRequestFailure.fetchProductListFailed(
            statusCode: failure.response?.statusCode,
            message: failure,
          ),
        );
      }
    }, (success) {
      if (success.statusCode == 200) {
        return right(
          ApiRequestSuccess.fetchProductListSuccess(
            products: List<ProductModel>.from(
              success.data.map(
                (x) => ProductModel.fromJson(x),
              ),
            ),
          ),
        );
      } else {
        return left(
          ApiRequestFailure.fetchProductListFailed(
            statusCode: 90001,
            message: success.data,
          ),
        );
      }
    });
  }
}
