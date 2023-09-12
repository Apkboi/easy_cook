import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:easy_cook/common/widgets/custom_search_bar.dart';
import 'package:easy_cook/features/bookmark/presentation/components/bookmark_filter_widget.dart';
import 'package:easy_cook/features/bookmark/presentation/components/bookmarked_recipe.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
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
                              child: CustomSearchBar(
                                  tittle: 'Search saved recipes')),
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
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Chip(
                              // backgroundColor:
                              //     Theme.of(context).colorScheme.primary,
                              deleteIconColor: Colors.grey,
                              iconTheme:
                                  const IconThemeData(color: Colors.white),
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      width: 0.3, color: Colors.grey)),
                              label: const Text(
                                'Beverages',
                                style: TextStyle(color: Colors.grey),
                              ),
                              onDeleted: () {},
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
          body: Builder(
            builder: (context) => ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => const BookmarkedRecipe(),
            ),
          )),
    );
  }
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
          child: BookmarkFilterWidget(),
        ),
      );
    },
  );

  log(result.toString());
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
          'Bookmarks',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Your favorite recipes at your fingertip',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
