import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/home_page.dart';
import '../screens/carts/carts_page.dart';
import '../screens/products/products.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ProductDetailsRoute.page),
        AutoRoute(page: PhotoViewerRoute.page),
        AutoRoute(page: CartsRoute.page),
      ];
}
