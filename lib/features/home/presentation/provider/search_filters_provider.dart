import 'package:easy_cook/common/models/recipe_filters_model.dart';
import 'package:easy_cook/features/home/presentation/notifiers/recipe_filter_notifier.dart';
import 'package:easy_cook/features/home/presentation/provider/duration_filter_provider.dart';
import 'package:easy_cook/features/home/presentation/provider/search_query_provider.dart';
import 'package:easy_cook/features/home/presentation/provider/selected_category_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateNotifierProvider<RecipesFilterNotifier, RecipeFilters>
    searchFiltersProvider =
    StateNotifierProvider((ref) => RecipesFilterNotifier(
        categoriesNotifier: ref.watch(searchFilterCategoryProvider.notifier),
        durationFilter: ref.watch(searchDurationFilterProvider.notifier),
        query: ref.watch(searchQueryProvider)));
