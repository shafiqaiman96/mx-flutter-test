// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    PhotoViewerRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoViewerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhotoViewerPage(
          key: args.key,
          imageUrl: args.imageUrl,
        ),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductDetailsPage(),
      );
    },
  };
}

/// generated route for
/// [CartsPage]
class CartsRoute extends PageRouteInfo<void> {
  const CartsRoute({List<PageRouteInfo>? children})
      : super(
          CartsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhotoViewerPage]
class PhotoViewerRoute extends PageRouteInfo<PhotoViewerRouteArgs> {
  PhotoViewerRoute({
    Key? key,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoViewerRoute.name,
          args: PhotoViewerRouteArgs(
            key: key,
            imageUrl: imageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoViewerRoute';

  static const PageInfo<PhotoViewerRouteArgs> page =
      PageInfo<PhotoViewerRouteArgs>(name);
}

class PhotoViewerRouteArgs {
  const PhotoViewerRouteArgs({
    this.key,
    required this.imageUrl,
  });

  final Key? key;

  final String imageUrl;

  @override
  String toString() {
    return 'PhotoViewerRouteArgs{key: $key, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [ProductDetailsPage]
class ProductDetailsRoute extends PageRouteInfo<void> {
  const ProductDetailsRoute({List<PageRouteInfo>? children})
      : super(
          ProductDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
