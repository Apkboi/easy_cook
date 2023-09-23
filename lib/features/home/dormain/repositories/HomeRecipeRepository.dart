import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:easy_cook/features/home/data/models/step.dart';
import 'package:either_dart/either.dart';

abstract class HomeRecipeRepository {
  Stream<Either<AppError, List<RecipeModel>>> fetchAllRecipes();

  Stream<Either<AppError, List<RecipeModel>>> fetchTrendingRecipes();

  Stream<Either<AppError, List<CookingStep>>> fetchRecipeSteps(String recipeId);

  Stream<Either<AppError, List<RecipeModel>>> fetchRecipesByCategory(
      String? categoryId);

  Stream<Either<AppError, List<RecipeModel>>> getRecipeByFilter(List filters);
}
