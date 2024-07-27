import '../models/models.dart';

class ApiRequestSuccess {
  const ApiRequestSuccess._();

  factory ApiRequestSuccess.fetchProductListSuccess({
    required List<ProductModel> products,
  }) = FetchProductListSuccess;
  factory ApiRequestSuccess.fetchProductDetailsSuccess({
    required ProductModel productDetails,
  }) = FetchProductDetailsSuccess;
}

class FetchProductListSuccess extends ApiRequestSuccess {
  final List<ProductModel> products;

  const FetchProductListSuccess({required this.products}) : super._();
}

class FetchProductDetailsSuccess extends ApiRequestSuccess {
  final ProductModel productDetails;

  const FetchProductDetailsSuccess({required this.productDetails}) : super._();
}
