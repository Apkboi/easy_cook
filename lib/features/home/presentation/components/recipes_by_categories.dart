import 'package:easy_cook/common/models/categories.dart';
import 'package:easy_cook/common/widgets/error_widget.dart';
import 'package:easy_cook/features/home/presentation/components/home_recipe_item.dart';
import 'package:easy_cook/features/home/presentation/provider/recipes_by_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipesByCategories extends ConsumerStatefulWidget {
  const RecipesByCategories({
    Key? key,
    required this.categoriesProvider,
  }) : super(key: key);
  final StateProvider<RecipeCategory?> categoriesProvider;

  @override
  ConsumerState<RecipesByCategories> createState() =>
      _RecipesByCategoriesState();
}

class _RecipesByCategoriesState extends ConsumerState<RecipesByCategories> {
  @override
  Widget build(BuildContext context) {
    final category = ref.watch(widget.categoriesProvider)?.id;
    final recipeProvider = ref.watch(recipeByCategoryProvider(category!));

    return recipeProvider.when(
      data: (data) {
        if (data.isNotEmpty) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: data.length,
            itemBuilder: (context, index) => HomeRecipeItem(
              recipe: data.toList()[index],
            ),
          );
        } else {
          return ListView(
            children: const [
              AppPromptWidget(
                title: "No recipes here",
                canTryAgain: false,
                message: '',
              )
            ],
          );
        }
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: const Center(
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator())));
      },
    );
  }
}
