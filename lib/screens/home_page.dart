import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mx_flutter_test/screens/home_page_loading.dart';
import 'package:mx_flutter_test/utils/utils.dart';

import '../global_widgets/global_widgets.dart';
import '../models/models.dart';
import 'products/products.dart';
import '../shared/shared.dart';

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

          notifier.getUniqueCategories();
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
            color: AppColors.grey,
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              'Discover products',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          const CategoryFilterWidget(),
          ref.watch(productNotifierProvider).isLoading
              ? const HomePageLoading()
              : const ListProductsWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(const CartsRoute()),
        backgroundColor: Colors.red,
        child: ValueListenableBuilder(
          valueListenable: Hive.box<ProductModel>('cartBox').listenable(),
          builder: (context, Box<ProductModel> box, _) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                if (box.length > 0)
                  Positioned(
                    right: -6,
                    top: -14,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${box.length}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
