import 'package:dartz/dartz.dart';

import '../api/api.dart';
import '../models/models.dart';

class ProductState {
  final bool isLoading;
  final ProductModel productOnView;
  final List<ProductModel> productsList;
  final List<ProductModel> filteredProductsList;
  final List<String> categoryList;

  final Option<Either<ApiRequestFailure, ApiRequestSuccess>>?
      failureOrSuccessOption;

  const ProductState({
    required this.isLoading,
    required this.productOnView,
    required this.productsList,
    required this.filteredProductsList,
    required this.failureOrSuccessOption,
    required this.categoryList,
  });

  factory ProductState.initial() {
    return ProductState(
      isLoading: false,
      productOnView: ProductModel(),
      productsList: [],
      filteredProductsList: [],
      failureOrSuccessOption: none(),
      categoryList: [],
    );
  }

  ProductState copyWith({
    bool? isLoading,
    bool? isForceUpdate,
    ProductModel? productOnView,
    List<ProductModel>? productsList,
    List<ProductModel>? filteredProductsList,
    Option<Either<ApiRequestFailure, ApiRequestSuccess>>?
        failureOrSuccessOption,
    final List<String>? categoryList,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      productOnView: productOnView ?? this.productOnView,
      productsList: productsList ?? this.productsList,
      filteredProductsList: filteredProductsList ?? this.filteredProductsList,
      failureOrSuccessOption:
          failureOrSuccessOption ?? this.failureOrSuccessOption,
      categoryList: categoryList ?? this.categoryList,
    );
  }
}
