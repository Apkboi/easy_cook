import 'dart:developer';
import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/bookmark_icon.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class TrendingRecipeItem extends StatefulWidget {
  const TrendingRecipeItem(
      {Key? key, required this.index, required this.recipe})
      : super(key: key);
  final int index;
  final RecipeModel recipe;

  @override
  State<TrendingRecipeItem> createState() => _TrendingRecipeItemState();
}

class _TrendingRecipeItemState extends State<TrendingRecipeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // log(context.router.root.currentPath);
        try {
          context.router.root.push(RecipeDetailsRoute(
              recipe: widget.recipe, heroTag: 'recipe${widget.recipe.id}'));
        } on Exception catch (e) {
          log(e.toString());
        }
      },
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Hero(
          tag: 'recipe${widget.recipe.id}',
          transitionOnUserGestures: true,
          key: GlobalKey(),
          createRectTween: (begin, end) {
            return RectTween(
              begin: begin,
              end: end,
            );
          },
          child: Material(
            child: Container(
              // margin: EdgeInsets.only(bottom: ),
              decoration: BoxDecoration(
                  boxShadow: const [
                    // BoxShadow(
                    //     color: Theme.of(context).colorScheme.primary,
                    //     blurRadius: 3,
                    //     spreadRadius: 1,
                    //     // blurStyle: BlurStyle.outer,
                    //     offset: const Offset(0, 2))
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.recipe.images.first,
                      ),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: const StadiumBorder(),
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.grey.withOpacity(0.4)),
                          onPressed: () {},
                          child: Text(widget.recipe.categoryName)),
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.recipe.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    BookmarkIcon(widget.recipe.id)
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${widget.recipe.durationInMinutes} mins | ${widget.recipe.servings} Serving(s)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
