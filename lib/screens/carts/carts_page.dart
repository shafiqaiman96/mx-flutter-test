import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../applications/applications.dart';
import '../../global_widgets/global_widgets.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

@RoutePage()
class CartsPage extends HookConsumerWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var totalPrice = CartsNotifier().calculateCartTotal();

    return Scaffold(
      body: Stack(
        children: [
          CustomAppBar(
            height: MediaQuery.sizeOf(context).height / 5,
            title: 'Your cart',
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height / 5),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable:
                      Hive.box<ProductModel>('cartBox').listenable(),
                  builder: (context, Box<ProductModel> box, _) {
                    return box.values.isEmpty
                        ? Center(
                            child: Text(
                              'No Item',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          )
                        : ListView(
                            children: [
                              for (int i = 0;
                                  i < box.values.length + 1;
                                  i++) ...[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 16.0,
                                  ),
                                  child: box.values.length == i
                                      ? Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Price:',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  'RM ${totalPrice.toStringAsFixed(2)}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: AppResizer.space120,
                                              height: AppResizer.space80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  AppResizer.space10,
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    box.getAt(i)?.image ?? '',
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
                                            const SizedBox(width: 8.0),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    box.getAt(i)?.title ?? '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                          color: Colors.black,
                                                        ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  const SizedBox(height: 4.0),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'RM ${box.getAt(i)?.price?.toStringAsFixed(2)}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color: Colors.red,
                                                      ),
                                                ),
                                                SizedBox(
                                                    height: AppResizer.space30),
                                                GestureDetector(
                                                  child: Text(
                                                    'Remove',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: Colors.grey,
                                                        ),
                                                  ),
                                                  onTap: () {
                                                    try {
                                                      box.deleteAt(i);
                                                      totalPrice = CartsNotifier()
                                                          .calculateCartTotal();
                                                    } catch (e) {
                                                      print(e);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppResizer.space20,
                                  ),
                                  child: Divider(
                                      color: Colors.red.withOpacity(.2)),
                                ),
                              ],
                            ],
                          );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          title: 'Check out',
          onTap: () {},
        ),
      ),
    );
  }
}
