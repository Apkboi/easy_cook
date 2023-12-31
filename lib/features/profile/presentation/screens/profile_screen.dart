import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/provider/user_cache_provider.dart';
import 'package:easy_cook/common/widgets/circular_loader.dart';
import 'package:easy_cook/common/widgets/custom_outlined_button.dart';
import 'package:easy_cook/common/widgets/error_widget.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/core/utils/app_images.dart';
import 'package:easy_cook/features/auth/presentation/provider/is_logged_in_provider.dart';
import 'package:easy_cook/features/bookmark/presentation/provider/bookmark_query_provider.dart';
import 'package:easy_cook/features/bookmark/presentation/provider/bookmarks_provider.dart';
import 'package:easy_cook/features/search/presentation/components/recipe_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final cachedUser = ref.watch(userCacheProvider);
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final bookmarks =
        ref.watch(bookmarksProvider(ref.watch(bookmarkQueryProvider)));
    return Scaffold(
        body: isLoggedIn
            ? Column(
                children: [
                  Expanded(
                    child: NestedScrollView(
                      floatHeaderSlivers: true,
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverAppBar(
                            expandedHeight: 200,
                            // pinned: true,
                            // snap: true,
                            floating: false,
                            flexibleSpace: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              fit: StackFit.passthrough,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.elliptical(-20, 20)),
                                    image: DecorationImage(
                                        image: AssetImage(AppImages.chops),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                    bottom: -50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImages.manImage),
                                              fit: BoxFit.cover),
                                          border: Border.all(
                                              width: 5,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      height: 100,
                                      width: 100,
                                    ))
                              ],
                            ),
                            leading: IconButton(
                                style: IconButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background),
                                onPressed: () {
                                  context.router.pop();
                                },
                                icon: Icon(
                                  FluentIcons.arrow_left_32_regular,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 20,
                                )),
                            actions: [
                              IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .background),
                                  onPressed: () {
                                    context.router.push(const SettingsRoute());
                                  },
                                  icon: Icon(
                                    FluentIcons.settings_32_filled,
                                    size: 20,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                            ],
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Center(
                                    child: Text(
                                      cachedUser?.fullName ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        cachedUser?.about ?? "",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bookmarked Recipes',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      // TextButton(
                                      //     onPressed: () {
                                      //       StorageHelper.clear();
                                      //     },
                                      //     child: const Text('View all'))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ];
                      },
                      body: bookmarks.when(data: (data) {
                        if (data.isNotEmpty) {
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
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomOutlinedButton(
                      onPressed: () {
                        _logout(context);
                      },
                      radius: 30,
                      outlinedColr: Colors.red,
                      foreGroundColor: Colors.red,
                      padding: const EdgeInsets.all(20),
                      child: const Text('Logout'),
                    ),
                  )
                ],
              )
            : Center(
                child: AppPromptWidget(
                  title: "UnAuthenticated",
                  imagePath: "assets/pngs/sorry.png",
                  retryText: 'Login',
                  message: "Login to create a profile with Easy cook",
                  onTap: () {
                    // StorageHelper.clear();
                    context.router.push(const LoginRoute());
                  },
                ),
              ));
  }

  void _logout(BuildContext context) {

    FirebaseAuth.instance.signOut();
    context.router.pushAndPopUntil(const LoginRoute(), predicate: (route) => false,);
  }
}
