import 'dart:async';

import 'package:easy_cook/core/di/repositories/home_recipe_repository_provider.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeByCategoryProvider =
    StreamProvider.family<Iterable<RecipeModel>, String>((ref, categoryId) {
  final controller = StreamController<Iterable<RecipeModel>>();
  final repository = ref.watch(homeRecipeRepositoryProvider);

  final sub = repository.fetchRecipesByCategory(categoryId).listen((event) {
    event.map((right) {
      controller.add(right);
    });
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});
