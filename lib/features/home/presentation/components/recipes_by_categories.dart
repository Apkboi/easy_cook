import 'package:easy_cook/features/home/presentation/components/home_recipe_item.dart';
import 'package:flutter/material.dart';

class RecipesByCategories extends StatefulWidget {
  const RecipesByCategories({Key? key}) : super(key: key);

  @override
  State<RecipesByCategories> createState() => _RecipesByCategoriesState();
}

class _RecipesByCategoriesState extends State<RecipesByCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => const HomeRecipeItem(),
    );
  }
}
