import 'dart:async';
import 'dart:developer';
import 'package:easy_cook/common/models/recipe_filters_model.dart';
import 'package:easy_cook/core/di/repositories/home_recipe_repository_provider.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:easy_cook/features/home/presentation/provider/search_query_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeByFilterProvider =
    StreamProvider.family<Iterable<RecipeModel>, RecipeFilters>((ref, filters) {
  final repository = ref.watch(homeRecipeRepositoryProvider);
  final controller = StreamController<List<RecipeModel>>();

  final sub = repository
      .getRecipeByFilter(filters.filters, ref.watch(searchQueryProvider))
      .listen((event) {
    event.fold((left) => controller.addError(left), (right) {
      controller.sink.add(right);

      log("ALL FILTERED RECIPES ${right.length}");
    });
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();

    log('Stream subscription canceled and controller closed');
  });

  return controller.stream.asBroadcastStream();
});
