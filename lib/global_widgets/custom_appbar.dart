import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mx_flutter_test/utils/utils.dart';

import '../shared/shared.dart';

class CustomAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final double height;
  final bool isHome;
  final String title;

  const CustomAppBar({
    super.key,
    required this.height,
    this.isHome = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList =
        ref.watch(productNotifierProvider).filteredProductsList;

    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        backgroundColor: const Color(0xfff7f7f7),
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(
          children: [
            SvgPicture.asset(
              'assets/background_header.svg',
              fit: BoxFit.fill,
              width: MediaQuery.sizeOf(context).width,
              height: height,
            ),
            Padding(
              padding: EdgeInsets.only(top: AppResizer.space40),
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage('assets/myEG_logo.png'),
                      filterQuality: FilterQuality.high,
                      width: AppResizer.space140,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: AppResizer.h3,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: AppResizer.space20),
                    !isHome
                        ? const SizedBox()
                        : Center(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 1.3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(AppResizer.space30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppResizer.space20,
                                    vertical: AppResizer.space16,
                                  ),
                                  suffixIcon: const Icon(Icons.search),
                                ),
                                onChanged: (value) {
                                  ref
                                      .read(productNotifierProvider.notifier)
                                      .searchProductsByName(value);
                                },
                              ),
                            ),
                          ),
                    if (productsList.isNotEmpty)
                      !isHome
                          ? const SizedBox()
                          : Container(
                              width: MediaQuery.sizeOf(context).width / 1.3,
                              height: MediaQuery.sizeOf(context).height / 4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: productsList
                                    .map(
                                      (item) => GestureDetector(
                                        onTap: () {
                                          ref
                                              .watch(
                                                productNotifierProvider
                                                    .notifier,
                                              )
                                              .setProductOnView(item);

                                          context.router.push(
                                              const ProductDetailsRoute());
                                        },
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                            AppResizer.space16,
                                            AppResizer.space16,
                                            AppResizer.space12,
                                            0,
                                          ),
                                          height: AppResizer.space25,
                                          child: Text(
                                            item.title ?? '',
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: Colors.black,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
