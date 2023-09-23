import 'dart:developer';
import 'package:auto_route/annotations.dart';

import 'package:easy_cook/common/widgets/circular_loader.dart';
import 'package:easy_cook/common/widgets/custom_search_bar.dart';
import 'package:easy_cook/common/widgets/recipe_filter_widget.dart';
import 'package:easy_cook/features/home/presentation/notifiers/recipe_filter_notifier.dart';
import 'package:easy_cook/features/home/presentation/notifiers/selected_categories_notifier.dart';
import 'package:easy_cook/features/home/presentation/provider/duration_filter_provider.dart';
import 'package:easy_cook/features/home/presentation/provider/recipe_by_filter_provider.dart';
import 'package:easy_cook/features/home/presentation/provider/search_filters_provider.dart';
import 'package:easy_cook/features/home/presentation/provider/search_query_provider.dart';
import 'package:easy_cook/features/home/presentation/provider/selected_category_provider.dart';
import 'package:easy_cook/features/search/presentation/components/recipe_item.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesByFilter =
        ref.watch(recipeByFilterProvider(ref.watch(searchFiltersProvider)));

    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const _TittleBar(),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomSearchBar(
                            tittle: 'Search Recipes',
                            onChanged: (val) {
                              _search(
                                query: val,
                                ref: ref,
                              );
                            },
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 13),
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                              onPressed: () {
                                _showFilterDialog(
                                  context,
                                  filtersNotifier:
                                      ref.watch(searchFiltersProvider.notifier),
                                  categoriesNotifier: ref.watch(
                                      searchFilterCategoryProvider.notifier),
                                );
                              },
                              child: const Icon(FluentIcons.filter_28_regular)),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ))
              ],
          body: recipesByFilter.when(data: (data) {
            return GridView.custom(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 0,
                // repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const WovenGridTile(0.7),
                  const WovenGridTile(
                    0.65,
                    crossAxisRatio: 1,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: data.length,
                (context, index) => RecipeItem(
                  recipe: data.toList()[index],
                ),
              ),
            );
          }, error: (e, stack) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: Text(e.toString()),
                  ),
                )
              ],
            );
          }, loading: () {
            return const CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: CircularLoader(),
                  ),
                )
              ],
            );
          })),
    );
  }

  void _showFilterDialog(
    BuildContext context, {
    required RecipesFilterNotifier filtersNotifier,
    required SelectedCategoryNotifier categoriesNotifier,
  }) async {
    var result = await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'tt',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedValue = Curves.easeInOut.transform(animation.value) - 1;

        return Transform(
          transform: Matrix4.translationValues(0, curvedValue * 100, 0),
          child: Align(
            alignment: Alignment.topCenter,
            child: RecipeFilterWidget(
              selectedCategoryProvider: searchFilterCategoryProvider,
              filtersNotifier: filtersNotifier,
              durationProvider: searchDurationFilterProvider,
            ),
          ),
        );
      },
    );

    log(result.toString());
  }

  void _search({String? query, required WidgetRef ref}) {
    ref.read(searchQueryProvider.notifier).state = query ?? '';
    ref.read(searchFiltersProvider.notifier).applyFilter();
  }
}

class _TittleBar extends StatefulWidget {
  const _TittleBar({Key? key}) : super(key: key);

  @override
  State<_TittleBar> createState() => _TittleBarState();
}

class _TittleBarState extends State<_TittleBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover Amazing Recipes',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Search and filter amazing recipes you like',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class RecentSearchItem extends StatefulWidget {
  const RecentSearchItem({Key? key}) : super(key: key);

  @override
  State<RecentSearchItem> createState() => _RecentSearchItemState();
}

class _RecentSearchItemState extends State<RecentSearchItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Vegetables soup',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey),
        ),
        InkWell(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Colors.grey,
            )),
      ],
    );
  }
}
