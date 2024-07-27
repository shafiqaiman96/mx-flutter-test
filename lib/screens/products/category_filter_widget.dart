import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/shared.dart';

class CategoryFilterWidget extends HookConsumerWidget {
  const CategoryFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productNotifierProvider).categoryList;
    final selectedCategory = useState<String?>(null);

    return Wrap(
      spacing: 4,
      children: categories.map((category) {
        return ChoiceChip(
          label: Text(
            category,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
          selected: selectedCategory.value == category,
          onSelected: (isSelected) async {
            selectedCategory.value = isSelected ? category : null;
            if (isSelected) {
              await ref
                  .read(productNotifierProvider.notifier)
                  .fetchProductList();

              ref
                  .read(productNotifierProvider.notifier)
                  .filterProductsByCategory(category);
            } else {
              ref.read(productNotifierProvider.notifier).fetchProductList();
            }
          },
        );
      }).toList(),
    );
  }
}
