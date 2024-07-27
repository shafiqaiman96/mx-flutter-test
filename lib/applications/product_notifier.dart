import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/api.dart';
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
}
