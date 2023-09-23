import 'dart:async';

import 'package:easy_cook/core/di/repositories/home_recipe_repository_provider.dart';
import 'package:easy_cook/features/home/data/models/step.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cookingStepsProvider =
    StreamProvider.family.autoDispose<Iterable<CookingStep>, String>(
  (ref, recipeId) {
    final allRecipesRepository = ref.read(homeRecipeRepositoryProvider);
    final controller = StreamController<Iterable<CookingStep>>();

    final sub = allRecipesRepository.fetchRecipeSteps(recipeId).listen((event) {
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
