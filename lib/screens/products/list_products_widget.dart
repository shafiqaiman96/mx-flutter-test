import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mx_flutter_test/shared/shared.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../global_widgets/global_widgets.dart';
import '../../utils/utils.dart';

class ListProductsWidget extends HookConsumerWidget {
  const ListProductsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList = ref.watch(productNotifierProvider).productsList;

    return Expanded(
      child: Container(
        color: const Color(0xfff7f7f7),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            0,
            AppResizer.space16,
            0,
          ),
          child: GridView(
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppResizer.space8,
              mainAxisSpacing: AppResizer.space8,
              childAspectRatio: 0.65,
            ),
            children: productsList
                .map(
                  (product) => GestureDetector(
                    onTap: () {
                      ref
                          .watch(productNotifierProvider.notifier)
                          .setProductOnView(product);

                      context.router.push(const ProductDetailsRoute());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppResizer.space10,
                        ),
                      ),
                      padding: EdgeInsets.all(AppResizer.space10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: AppResizer.space4,
                            ),
                            width: AppResizer.space200,
                            height: AppResizer.space150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppResizer.space10,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppResizer.space10,
                              ),
                              child: NetworkImageWidget(
                                imageUrl: product.image ?? '',
                              ),
                            ),
                          ),
                          Text(
                            product.title ?? '',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black,
                                    ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(height: AppResizer.space8),
                          Text(
                            'RM ${product.price}',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                          ),
                          SizedBox(height: AppResizer.space4),
                          Row(
                            children: [
                              RatingBar.builder(
                                itemSize: AppResizer.space16,
                                initialRating: product.rating?.rate ?? 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: AppResizer.space1,
                                ),
                                onRatingUpdate: (rating) {},
                                ignoreGestures: true,
                              ),
                              Text(
                                ' (${product.rating?.rate})',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            ' (${product.rating?.count} sold)',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
