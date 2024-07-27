import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/api.dart';
import '../models/models.dart';
import '../repository/repository.dart';
import 'products_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductRepository _repository;

  ProductNotifier(this._repository) : super(ProductState.initial());

  Future<void> fetchProductList() async {
    state = state.copyWith(isLoading: true, failureOrSuccessOption: none());

    final failureOrSuccess = await _repository.fetchProductList();

    state = state.copyWith(
      isLoading: false,
      failureOrSuccessOption: some(failureOrSuccess),
      productsList: failureOrSuccess.fold(
        (failure) => [],
        (success) => (success as FetchProductListSuccess).products,
      ),
    );
  }

  void setProductOnView(ProductModel product) {
    state = state.copyWith(productOnView: product);
  }

  void searchProductsByName(String query) {
    final lowercaseQuery = query.toLowerCase();

    if (query.isEmpty) {
      state = state.copyWith(filteredProductsList: []);
    } else {
      final filteredProducts = state.productsList
          .where((product) {
            return product.title?.toLowerCase().contains(lowercaseQuery) ??
                false;
          })
          .take(5)
          .toList();

      state = state.copyWith(
        filteredProductsList: filteredProducts,
      );
    }
  }

  void getUniqueCategories() {
    final categories = state.productsList
        .map((product) => product.category ?? '')
        .toSet()
        .toList();

    state = state.copyWith(categoryList: categories);
  }

  void filterProductsByCategory(String category) {
    final filteredProducts = state.productsList
        .where(
          (product) =>
              product.category?.toLowerCase() == category.toLowerCase(),
        )
        .toList();

    state = state.copyWith(productsList: filteredProducts);
  }
}
