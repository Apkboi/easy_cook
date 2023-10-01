import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/circular_loader.dart';
import 'package:easy_cook/common/widgets/custom_search_bar.dart';
import 'package:easy_cook/common/widgets/error_widget.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/features/auth/presentation/provider/is_logged_in_provider.dart';
import 'package:easy_cook/features/bookmark/presentation/components/bookmark_filter_widget.dart';
import 'package:easy_cook/features/bookmark/presentation/components/bookmarked_recipe.dart';
import 'package:easy_cook/features/bookmark/presentation/provider/bookmark_query_provider.dart';
import 'package:easy_cook/features/bookmark/presentation/provider/bookmarks_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final bookmarks =
        ref.watch(bookmarksProvider(ref.watch(bookmarkQueryProvider)));
    final isLoggedIn = ref.watch(isLoggedInProvider);
    return isLoggedIn
        ? Scaffold(
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
                                Expanded(
                                    child: CustomSearchBar(
                                        onChanged: (val) {
                                          ref
                                              .read(bookmarkQueryProvider
                                                  .notifier)
                                              .state = val ?? " ";
                                        },
                                        tittle: 'Search saved recipes')),
                                // const SizedBox(
                                //   width: 10,
                                // ),
                                // TextButton(
                                //     style: TextButton.styleFrom(
                                //         backgroundColor:
                                //             Theme.of(context).colorScheme.primary,
                                //         padding:
                                //             const EdgeInsets.symmetric(vertical: 13),
                                //         foregroundColor:
                                //             Theme.of(context).colorScheme.onPrimary,
                                //         shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(4))),
                                //     onPressed: () {
                                //       _showFilterDialog(context);
                                //     },
                                //     child: const Icon(FluentIcons.filter_28_regular)),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ))
                    ],
                body: bookmarks.when(data: (data) {
                  if (data.isNotEmpty) {
                    return Builder(
                      builder: (context) => ListView.builder(
                        itemCount: data.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) => BookmarkedRecipe(
                          recipe: data[index],
                        ),
                      ),
                    );
                  } else {
                    return ListView(
                      children: [
                        AppPromptWidget(
                          isSvgResource: false,
                          title: 'No bookmarks',
                          message:
                              "You have no bookmarks yet explore more recipes.",
                          canTryAgain: false,
                          onTap: () {
                            ref.invalidate(bookmarksProvider(" "));

                            // context.watchTabsRouter.setActiveIndex(1);
                          },
                        ),
                      ],
                    );
                  }
                }, error: (e, stack) {
                  return ListView(
                    children: [
                      AppPromptWidget(
                        title: e.toString(),
                      ),
                    ],
                  );
                }, loading: () {
                  return Center(
                    child: CircularLoader(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                })),
          )
        : Center(
            child: AppPromptWidget(
              title: "UnAuthenticated",
              imagePath: "assets/images/pngs/sorry.png",
              retryText: 'Login',
              message: "Login to add bookmarks with Easy cook",
              onTap: () {
                // StorageHelper.clear();
                context.router.push(const LoginRoute());
              },
            ),
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
          'Your favorite recipes.json at your fingertip',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
