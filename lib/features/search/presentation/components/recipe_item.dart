import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatefulWidget {
  const RecipeItem({Key? key, required this.recipe}) : super(key: key);
  final RecipeModel recipe;

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(RecipeDetailsRoute(
            recipe: widget.recipe, heroTag: "recipeF${widget.recipe.id}"));
      },
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(),
        child: Hero(
          tag: "recipeF${widget.recipe.id}",
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      widget.recipe.images.first,
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 25,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.grey.withOpacity(0.4)),
                        onPressed: () {},
                        child: Text(widget.recipe.categoryName)),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                        // Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.5),
                        Colors.black,
                        Colors.black,
                      ])),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            Expanded(
                              child: Text(
                                "${widget.recipe.name}/",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                              ),
                            ),
                            // IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(
                            //       FluentIcons.bookmark_28_filled,
                            //       color:
                            //       Theme.of(context).colorScheme.primary,
                            //     ))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${widget.recipe.durationInMinutes} Mins | ${widget.recipe.servings} Serving',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // height: 300,
          ),
        ),
      ),
    );
  }
}
