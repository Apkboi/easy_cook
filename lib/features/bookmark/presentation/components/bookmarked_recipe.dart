import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/bookmark_icon.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BookmarkedRecipe extends StatefulWidget {
  const BookmarkedRecipe({Key? key, required this.recipe}) : super(key: key);
  final RecipeModel recipe;

  @override
  State<BookmarkedRecipe> createState() => _BookmarkedRecipeState();
}

class _BookmarkedRecipeState extends State<BookmarkedRecipe> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: InkWell(
        onTap: () {
          context.router.push(RecipeDetailsRoute(
              recipe: widget.recipe, heroTag: "bookmark${widget.recipe.id}"));
        },
        child: Hero(
          tag: "bookmark${widget.recipe.id}",
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Scaffold(
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.network(
                        widget.recipe.images.first,
                        fit: BoxFit.cover,
                        height: 170,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 4,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.recipe.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              BookmarkIcon(widget.recipe.id)
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FluentIcons.timer_10_20_regular,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ' ${widget.recipe.durationInMinutes}mins Cooking time',
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FluentIcons.food_20_regular,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${widget.recipe.servings} serving',
                                      style: const TextStyle(
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 35,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  shape: const RoundedRectangleBorder(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 5),
                                  side: const BorderSide(color: Colors.grey)),
                              child: Text(
                                widget.recipe.categoryName,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
