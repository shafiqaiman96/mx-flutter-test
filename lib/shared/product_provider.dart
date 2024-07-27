import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/api.dart';
import '../applications/applications.dart';
import '../repository/repository.dart';

final dioProvider = Provider((ref) => Dio());

final apiUtilProvider = Provider((ref) => ApiRequest(ref.watch(dioProvider)));

final productRepositoryProvider = Provider(
  (ref) => ProductRepository(ref.watch(apiUtilProvider)),
);

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(ref.watch(productRepositoryProvider)),
);
