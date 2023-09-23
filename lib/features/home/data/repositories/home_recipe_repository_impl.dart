import 'dart:developer';
import 'package:async/async.dart' show  StreamZip;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/common/models/recipe_filters_model.dart';
import 'package:easy_cook/core/constants/firebase/firebase_collections.dart';
import 'package:easy_cook/core/constants/firebase/firebase_fields.dart';
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
      List<dynamic> filters) {
    CollectionReference<Map<String, dynamic>> itemsCollection =
        FirebaseFirestore.instance.collection(FirebaseCollections.recipe);

    Query<Map<String, dynamic>> query = itemsCollection;
    final List<Stream<QuerySnapshot<Map<String, dynamic>>>> allQuerySnapShots =
        [];


    for (RecipeFilterModel filter in filters) {
      switch (filter.operator) {
        case '==':
          allQuerySnapShots.add(
              query.where(filter.field, isEqualTo: filter.value).snapshots());
          break;
        case '<':
          allQuerySnapShots.add(
              query.where(filter.field, isLessThan: filter.value).snapshots());
          break;
        case '>':
          allQuerySnapShots.add(query
              .where(filter.field, isGreaterThan: filter.value)
              .snapshots());
          break;
        case 'fieldsContains':

          query.snapshots().map((event) {

            var allRecipes = event.docs.map((e) => RecipeModel.fromJson(e.data())).toList();
            var filteredRecipes = allRecipes.where((element) => (element.toJson()[filter.field] as String).contains(filter.value)).toList();

            return Right(filteredRecipes);
          });

          break;
      }
    }

    log('e reach here oh 🙀 ');

    if (allQuerySnapShots.isEmpty) {
      return query.snapshots().map((event) {
        return Right(
            event.docs.map((e) => RecipeModel.fromJson(e.data())).toList());
      });
    } else {
      return StreamZip<QuerySnapshot<Map<String, dynamic>>>(allQuerySnapShots)
          .asBroadcastStream()
          .map((event) {

        final mergedDocuments =
        event.expand((snapshot) => snapshot.docs).toList();
        return Right(mergedDocuments.map((e) => RecipeModel.fromJson(e.data())).toList());

      });
    }
  }
}
