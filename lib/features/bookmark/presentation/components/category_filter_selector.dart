import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/models/categories.dart';
import 'package:easy_cook/common/provider/categories_provider.dart';
import 'package:easy_cook/common/widgets/circular_loader.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/features/home/presentation/notifiers/recipe_filter_notifier.dart';
import 'package:easy_cook/features/home/presentation/notifiers/selected_categories_notifier.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryFilterSelector extends ConsumerStatefulWidget {
  const CategoryFilterSelector({
    Key? key,
    required this.filtersProvider,
    required this.selectedCategoryProvider,
  }) : super(key: key);

  final RecipesFilterNotifier filtersProvider;
  final StateNotifierProvider<SelectedCategoryNotifier, SelectedCategories>
      selectedCategoryProvider;

  @override
  ConsumerState<CategoryFilterSelector> createState() =>
      _CategoryFilterSelectorState();
}

class _CategoryFilterSelectorState
    extends ConsumerState<CategoryFilterSelector> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(widget.selectedCategoryProvider);

    return categories.when(data: (data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter Categories',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            children: List.generate(
                data.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: ChoiceChip(
                          color: const MaterialStatePropertyAll(
                              Colors.transparent),
                          backgroundColor: Colors.transparent,
                          shape: const StadiumBorder(),
                          onSelected: (val) {
                            ref
                                .read(widget.selectedCategoryProvider.notifier)
                                .selectCategory(
                                  data.toList()[index],
                                );
                          },
                          selectedColor: Theme.of(context).colorScheme.primary,
                          side:
                              const BorderSide(width: 0.5, color: Colors.grey),
                          label: Text(data.toList()[index].name),
                          selected: selectedCategory.selectedCategories
                              .map((e) => e.id)
                              .contains(data.toList()[index].id)),
                    )),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Apply filter'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(FluentIcons.options_20_regular)
                ],
              ),
              onPressed: () {
                _applyFilter();
              }),
          const SizedBox(
            height: 16,
          ),
        ],
      );
    }, error: (e, stack) {
      return Text(e.toString());
    }, loading: () {
      return const SizedBox(
        height: 200,
        child: Center(
          child: CircularLoader(),
        ),
      );
    });
  }

  void _applyFilter() {
    widget.filtersProvider.applyFilter();
    context.router.pop();
  }
}
