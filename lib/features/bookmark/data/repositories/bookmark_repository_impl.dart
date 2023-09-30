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
      {required String uid}) {
    try {
      StreamController<Either<AppError, List<RecipeModel>>> controller =
          StreamController<Either<AppError, List<RecipeModel>>>();
      List<String> recpeIds = [];

      // db.collection(FirebaseCollections.bookmarks)
      //     .where(FirebaseFields.bookmarkedBy, isEqualTo: uid)
      //     .snapshots()
      //     .listen((event) {
      //   log(event.docs.length.toString());
      //
      //   event.docs.map((e) async {
      //     final bookMark = BookmarkModel.fromJson(e.data());
      //     recpeIds.add(bookMark.recipeId);
      //     if (recpeIds.isNotEmpty) {
      //       log('Event received');
      //       return db
      //           .collection(FirebaseCollections.recipe)
      //           .where(FirebaseFields.recipeId, whereIn: recpeIds)
      //           .snapshots()
      //           .map((event) {
      //         controller.sink.add(Right(event.docs
      //             .map((e) => RecipeModel.fromJson(e.data()))
      //             .toList()));
      //       });
      //     } else {
      //       controller.sink.add(const Right([]));
      //     }
      //   });
      // });

      return Stream.periodic(
        const Duration(
          milliseconds: 400,
        ),
        (computationCount) {
          return const Right([]);
        },
      );
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
