import 'dart:async';

import 'package:easy_cook/features/bookmark/presentation/provider/bookmarks_repo_provider.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookmarksProvider = StreamProvider<List<RecipeModel>>((ref) {
  final bookMarksRepo = ref.watch(bookmarksRepoProvider);

  StreamController<List<RecipeModel>> controller = StreamController();
  String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

  var sub = bookMarksRepo.getUserBookMarks(uid: uid).listen((event) {
    event.fold((left) {
      controller.sink.addError(left);
    }, (right) {
      controller.sink.add(right);
    });
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
