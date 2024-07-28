import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../global_widgets/global_widgets.dart';
import '../../shared/shared.dart';
import '../../utils/utils.dart';

@RoutePage()
class ProductDetailsPage extends HookConsumerWidget {
  const ProductDetailsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productNotifierProvider).productOnView;

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomAppBar(
                height: MediaQuery.sizeOf(context).height / 2.5,
                title: 'Product Details',
              ),
              Positioned(
                top: AppResizer.space160,
                left: MediaQuery.sizeOf(context).width / 2 -
                    (MediaQuery.sizeOf(context).width / 1.3 / 2),
                child: Center(
                  child: GestureDetector(
                    onTap: () => context.router.push(
                      PhotoViewerRoute(imageUrl: product.image ?? ''),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width / 1.3,
                          height: MediaQuery.sizeOf(context).height / 2.5,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppResizer.space30),
                            image: DecorationImage(
                              image: NetworkImage(
                                product.image ?? '',
                              ),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Icon(
                            Icons.zoom_in,
                            size: AppResizer.space40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppResizer.space30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 5,
                ),
                Text(
                  product.title ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: AppResizer.space8),
                Text(
                  'RM ${product.price?.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
                Text(
                  ' (${product.rating?.count} sold)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppResizer.space20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppResizer.space30),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(top: AppResizer.space16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppResizer.space30),
                      child: Text(
                        'Description:',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppResizer.space30,
                        vertical: AppResizer.space10,
                      ),
                      child: Text(
                        product.description ?? '',
                        style:
                            Theme.of(context).textTheme.bodySmall?.copyWith(),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          title: 'Add to cart',
          onTap: () async {
            await cartBox.value.add(product);

            showSnackBar(
              // ignore: use_build_context_synchronously
              context,
              '${product.title} had been added to cart',
            );
          },
        ),
      ),
    );
  }
}
