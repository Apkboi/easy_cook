import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:either_dart/either.dart';

abstract class BookmarkRepository {
  Stream<Either<AppError, List<RecipeModel>>> getUserBookMarks(
      {required String uid, required String query});

  Future<Either<AppError, dynamic>> bookMarkRecipe(
      {required String uid, required String recipeId});
}
