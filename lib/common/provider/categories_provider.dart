import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_cook/common/models/categories.dart';
import 'package:easy_cook/core/constants/firebase/firebase_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoriesProvider = StreamProvider.autoDispose<Iterable<RecipeCategory>>(
  (ref) {
    final controller = StreamController<Iterable<RecipeCategory>>();
    final sub = FirebaseFirestore.instance
        .collection(
          FirebaseCollections.categories,
        )
        .snapshots()
        .listen((event) {
      final categories = event.docs.map(
        (doc) => RecipeCategory.fromJson(doc.data()),
      );
      controller.sink.add(categories);
    });

    ref.onDispose(() {
      controller.close();
      sub.cancel();
    });





    return controller.stream;
  },
);



