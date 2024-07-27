import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mx_flutter_test/home_page_loading.dart';

import 'products/products.dart';
import 'shared/shared.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future<void> fetchData() async {
          final notifier = ref.read(productNotifierProvider.notifier);
          await notifier.fetchProductList();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          fetchData();
        });
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'MyEG Store',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ref.watch(productNotifierProvider).isLoading
          ? const HomePageLoading()
          : const ListProductsWidget(),
    );
  }
}
