import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/bookmark_icon.dart';
import 'package:easy_cook/common/widgets/stacked_images_widget.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:easy_cook/features/home/presentation/components/ingredients_item.dart';
import 'package:easy_cook/features/home/presentation/components/review_item.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen(
      {Key? key, required this.recipe, required this.heroTag})
      : super(key: key);
  final RecipeModel recipe;
  final String heroTag;

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () {
              context.router.root.push(CookingRoute(recipe: widget.recipe));
            },
            child: const Text(
              'Start Cooking',
              style: TextStyle(color: Colors.white),
            )),
      ),
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
                BookmarkIcon(
                  widget.recipe.id,
                  unBookMarkedColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  buttonStyle: IconButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.background),
                )
              ],
              flexibleSpace: Hero(
                tag: widget.heroTag,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.recipe.images.first),
                          fit: BoxFit.cover)),
                ),
              ),
              bottom: PreferredSize(
                preferredSize:
                    Size(0, MediaQuery.of(context).size.height * 0.5),
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
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              side: const BorderSide(
                                                  color: Colors.white),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              shape: const StadiumBorder()),
                                          onPressed: () {},
                                          child: const Text('Follow'))
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
                                  widget.recipe.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.recipe.categoryName,
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
                            '${widget.recipe.ingredients.length} items',
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
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IngredientsItem(
                    ingredient: widget.recipe.ingredients[index],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '👏 Reviews',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ReviewItem(),
                ),
              )
            ]),
      ),
    );
  }
}

class _TextScreen extends StatefulWidget {
  const _TextScreen({Key? key}) : super(key: key);

  @override
  State<_TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<_TextScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
