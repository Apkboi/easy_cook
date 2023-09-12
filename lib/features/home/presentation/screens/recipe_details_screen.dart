import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/stacked_images_widget.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/core/utils/app_images.dart';
import 'package:easy_cook/features/home/presentation/components/ingredients_item.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary),
          onPressed: () {
            context.router.root.push(const CookingRoute());
          },
          child: const Text(
            'Start Cooking',
            style: TextStyle(color: Colors.white),
          )),
      body: NestedScrollView(
        // floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              forceElevated: true,
              collapsedHeight: 60,
              // pinned: true,
              // snap: true,
              expandedHeight: 300,
              backgroundColor: Theme.of(context).colorScheme.surface,
              leading: IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.background),
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
                        backgroundColor:
                            Theme.of(context).colorScheme.background),
                    onPressed: () {},
                    icon: Icon(
                      FluentIcons.bookmark_32_filled,
                      size: 20,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ],
              flexibleSpace: Hero(
                tag: 'recipe0',
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.pizza2),
                          fit: BoxFit.cover)),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size(0, 250),
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 6, sigmaX: 6),
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13.0, horizontal: 10),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 22,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Recipe by:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              'Renata Moeloeke',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        FluentIcons.arrow_right_32_regular,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
          // return
        },
        body: CustomScrollView(
            // physics: const NeverScrollableScrollPhysics(),

            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Spaghetti with shrimp sauce',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Spaghetti with shrimp sauce',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const StackedImagesWidget(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('Already tried this',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: Colors.grey))
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Ingredients',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                          ),
                          Text(
                            '7 items',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: IngredientsItem(),
                ),
              )
            ]),
      ),
    );
  }
}
