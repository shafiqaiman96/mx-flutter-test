import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mx_flutter_test/home_page_loading.dart';
import 'package:mx_flutter_test/utils/utils.dart';

import 'global_widgets/global_widgets.dart';
import 'screens/products/products.dart';
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

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await fetchData();
        });
        return null;
      },
      [],
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          CustomAppBar(
            height: MediaQuery.sizeOf(context).height / 2.5,
            isHome: true,
            title: 'Store',
          ),
          Container(
            padding: EdgeInsets.only(
              top: AppResizer.space16,
              left: AppResizer.space16,
            ),
            color: const Color(0xfff7f7f7),
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              'Discover products',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          ref.watch(productNotifierProvider).isLoading
              ? const HomePageLoading()
              : const ListProductsWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(const CartsRoute()),
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
