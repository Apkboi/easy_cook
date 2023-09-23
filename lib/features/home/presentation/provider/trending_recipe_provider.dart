import 'dart:async';

import 'package:easy_cook/core/di/repositories/home_recipe_repository_provider.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final allRecipesProvider = StreamProvider.autoDispose<Iterable<RecipeModel>>(
  (ref) {
    final allRecipesRepository = ref.read(homeRecipeRepositoryProvider);
    final controller = StreamController<Iterable<RecipeModel>>();
    final sub = allRecipesRepository.fetchAllRecipes().listen((event) {
      event.fold((left) => controller.addError(left), (right) {
        controller.sink.add(right);
      });
    });

    ref.onDispose(() {
      controller.close();
      sub.cancel();
    });

    return controller.stream;
  },
);
