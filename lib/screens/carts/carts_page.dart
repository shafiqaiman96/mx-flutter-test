import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/models.dart';

@RoutePage()
class CartsPage extends HookConsumerWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ProductModel>('cartBox').listenable(),
        builder: (context, Box<ProductModel> box, _) {
          return ListView(
            children: [
              for (int i = 0; i < box.values.length; i++)
                Row(
                  children: [
                    Text(
                      box.getAt(i)?.title ?? '',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    IconButton(
                      onPressed: () {
                        try {
                          box.deleteAt(i);
                        } catch (e) {
                          print(e);
                        }
                      },
                      icon: const Icon(Icons.highlight_remove_rounded),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
