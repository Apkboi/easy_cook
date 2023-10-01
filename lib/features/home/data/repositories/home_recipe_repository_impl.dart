import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/common/models/recipe_filters_model.dart';
import 'package:easy_cook/core/constants/firebase/firebase_collections.dart';
import 'package:easy_cook/core/constants/firebase/firebase_fields.dart';
import 'package:easy_cook/core/extensions/firebase_query_extension.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:easy_cook/features/home/data/models/step.dart';
import 'package:easy_cook/features/home/dormain/repositories/HomeRecipeRepository.dart';
import 'package:either_dart/either.dart';

class HomeRecipeRepositoryImpl extends HomeRecipeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<Either<AppError, List<RecipeModel>>> fetchAllRecipes() {
    try {
      return _firestore
          .collection(FirebaseCollections.recipe)
          .snapshots()
          .map((snapshot) {
        var allData = snapshot.docs
            .map((doc) => RecipeModel.fromJson(doc.data()))
            .toList();

        return Right(allData);
      });
    } on Exception catch (e) {
      return Stream.value(Left(AppError.fromException(e)));
    }
  }

  @override
  Stream<Either<AppError, List<RecipeModel>>> fetchTrendingRecipes() {
    try {
      return _firestore
          .collection(FirebaseCollections.recipe)
          .snapshots()
          .map((snapshot) {
        var allData = snapshot.docs
            .map((doc) => RecipeModel.fromJson(doc.data()))
            .toList();
        return Right(allData);
      });
    } on Exception catch (e) {
      return Stream.value(Left(AppError.fromException(e)));
    }
  }

  @override
  Stream<Either<AppError, List<CookingStep>>> fetchRecipeSteps(
      String recipeId) {
    try {
      return _firestore
          .collection(FirebaseCollections.recipe)
          .doc(recipeId)
          .collection(FirebaseCollections.steps)
          .snapshots()
          .map((snapshot) {
        var allData = snapshot.docs
            .map((doc) => CookingStep.fromJson(doc.data()))
            .toList();

        log(recipeId);
        return Right(allData);
      });
    } on Exception catch (e) {
      log(e.toString());
      return Stream.value(Left(AppError.fromException(e)));
    }
  }

  @override
  Stream<Either<AppError, List<RecipeModel>>> fetchRecipesByCategory(
      String? categoryId) {
    try {
      if (categoryId == null || categoryId.isEmpty) {
        return fetchAllRecipes();
      } else {
        return _firestore
            .collection(FirebaseCollections.recipe)
            .where(FirebaseFields.categoryId, isEqualTo: categoryId)
            .snapshots()
            .map((snapshot) {
          var allData = snapshot.docs
              .map((doc) => RecipeModel.fromJson(doc.data()))
              .toList();

          return Right(allData);
        });
      }
    } on Exception catch (e) {
      log(e.toString());
      return Stream.value(Left(AppError.fromException(e)));
    }
  }

  @override
  Stream<Either<AppError, List<RecipeModel>>> getRecipeByFilter(
      List<RecipeFilterModel> filters, String? queryText) {
    CollectionReference<Map<String, dynamic>> itemsCollection =
        FirebaseFirestore.instance.collection(FirebaseCollections.recipe);

    Query<Map<String, dynamic>> query = itemsCollection;

    final filteredQuery = query.applyFilters(filters: filters);

    return filteredQuery.snapshots().map((event) {
      return Right(event.docs
          .map((e) => RecipeModel.fromJson(e.data()))
          .toList()
          .where((element) => element.name
              .toUpperCase()
              .contains(queryText?.toUpperCase() ?? ' '))
          .toList());
    });
  }
}
