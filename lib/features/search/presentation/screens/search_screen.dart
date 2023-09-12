import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:easy_cook/common/widgets/custom_search_bar.dart';
import 'package:easy_cook/common/widgets/recipe_filter_widget.dart';
import 'package:easy_cook/features/home/presentation/components/recipe_category_switcher.dart';
import 'package:easy_cook/features/search/presentation/components/recipe_item.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
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
                          const Expanded(
                              child: CustomSearchBar(tittle: 'Search Recipes')),
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
                                _showFilterDialog(context);
                              },
                              child: const Icon(FluentIcons.filter_28_regular)),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Recent Searches',
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .titleMedium
                      //           ?.copyWith(fontWeight: FontWeight.w700),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: const Text('Clear all'),
                      //     )
                      //   ],
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Column(
                      //     children: [
                      //       RecentSearchItem(),
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //       RecentSearchItem(),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      const RecipeCategorySwitcher()
                    ],
                  ),
                ))
              ],
          body: Builder(
            builder: (context) => GridView.custom(
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
                (context, index) => const RecipeItem(),
              ),
            ),
          )),
    );
  }
  void _showFilterDialog(BuildContext context) async {
    var result = await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'tt',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedValue = Curves.easeInBack.transform(animation.value) - 1;
        log(curvedValue.toString());
        return Transform(
          transform: Matrix4.translationValues(0, curvedValue * 100, 0),
          child: const Align(
            alignment: Alignment.topCenter,
            child: RecipeFilterWidget(),
          ),
        );
      },
    );

    log(result.toString());
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
