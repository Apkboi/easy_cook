import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class HomeRecipeItem extends StatefulWidget {
  const HomeRecipeItem({Key? key, required this.recipe}) : super(key: key);
  final RecipeModel recipe;

  @override
  State<HomeRecipeItem> createState() => _HomeRecipeItemState();
}

class _HomeRecipeItemState extends State<HomeRecipeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.root.push(RecipeDetailsRoute(
            recipe: widget.recipe, heroTag: 'recipeByCat${widget.recipe.id}'));
      },
      child: Card(
        color: Theme.of(context).colorScheme.background,
        shadowColor: Colors.grey,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 75,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'recipeByCat${widget.recipe.id}',
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: NetworkImage(widget.recipe.images.first),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.recipe.name,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      widget.recipe.categoryName,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '${widget.recipe.durationInMinutes} Mins | ${widget.recipe.servings} Serving',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.grey),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
