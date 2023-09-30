import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/core/constants/firebase/firebase_collections.dart';
import 'package:easy_cook/core/constants/firebase/firebase_fields.dart';
import 'package:easy_cook/features/bookmark/data/models/bookmark_model.dart';
import 'package:easy_cook/features/bookmark/dormain/repositories/bookmark_repository.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:either_dart/either.dart';

class BookmarkRepositoryImpl extends BookmarkRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Stream<Either<AppError, List<RecipeModel>>> getUserBookMarks(
      {required String uid, required String query}) {
    try {
      StreamController<Either<AppError, List<RecipeModel>>> controller =
          StreamController<Either<AppError, List<RecipeModel>>>();

      db
          .collection(FirebaseCollections.bookmarks)
          .where(FirebaseFields.bookmarkedBy, isEqualTo: uid)
          .snapshots()
          .listen((event) {
        _addBookmarkedRecipe(event, controller, query);
      });

      return controller.stream;
    } on Exception catch (e) {
      return Stream.value(Left(AppError.fromException(e)));
    }
  }

  @override
  Future<Either<AppError, dynamic>> bookMarkRecipe(
      {required String uid, required String recipeId}) async {
    var availableRecipes = await db
        .collection(FirebaseCollections.bookmarks)
        .where(FirebaseFields.bookmarkedBy, isEqualTo: uid)
        .where(FirebaseFields.recipeId, isEqualTo: recipeId)
        .get();

    if (availableRecipes.docs.isNotEmpty) {
      try {
        for (var recipe in availableRecipes.docs) {
          recipe.reference.delete();
        }
        return const Right(true);
      } on Exception catch (e) {
        log(e.toString());
        return Left(AppError.fromException(e));
      }
    } else {
      try {
        final bookMark = BookmarkModel(
            bookmarkedBy: uid, recipeId: recipeId, date: DateTime.now());
        await FirebaseFirestore.instance
            .collection(FirebaseCollections.bookmarks)
            .add(bookMark.toJson());

        return const Right(true);
      } on Exception catch (e) {
        log(e.toString());
        return Left(AppError.fromException(e));
      }
    }
  }
}

void _addBookmarkedRecipe(
    QuerySnapshot<Map<String, dynamic>> event,
    StreamController<Either<AppError, List<RecipeModel>>> controller,
    String query) {
  var ids = event.docs.map((e) => e.data()[FirebaseFields.recipeId]);

  // log("ALL IDS${ids.length.toString()}");

  var collectionQuery = FirebaseFirestore.instance
      .collection(FirebaseCollections.recipe)
      .where("id", whereIn: ids);

  collectionQuery.snapshots().listen((event) {
    controller.sink.add(Right(event.docs
        .map((e) => RecipeModel.fromJson(e.data()))
        .toList()
        .where((element) =>
            element.name.toUpperCase().contains(query.toUpperCase()))
        .toList()));
    // log("RECIPES${event.size.toString()}");
  });
}
