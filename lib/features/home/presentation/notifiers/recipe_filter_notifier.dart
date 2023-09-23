import 'dart:developer';

import 'package:easy_cook/common/models/recipe_filters_model.dart';
import 'package:easy_cook/core/constants/firebase/firebase_fields.dart';
import 'package:easy_cook/features/home/presentation/notifiers/search_duration_filter.dart';
import 'package:easy_cook/features/home/presentation/notifiers/selected_categories_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecipesFilterNotifier extends StateNotifier<RecipeFilters> {
  RecipesFilterNotifier({
    required this.categoriesNotifier,
    required this.query,
    required this.durationFilter,
  }) : super(RecipeFilters([]));
  final SelectedCategoryNotifier categoriesNotifier;
  final SearchDurationFilter durationFilter;
  final String query;

  final List<RecipeFilterModel> _filters = [];

  List<RecipeFilterModel> get filters => _filters;

  void removeFilter(RecipeFilterModel filter) {
    state = RecipeFilters(state.filters.where((f) => f != filter).toList());
    if (filter.field == FirebaseFields.categoryId) {
      categoriesNotifier.removeById(filter.value);
    } else if (filter.field == "duration") {
      //  TODO: REMOVE/RESET DURATION....
    }

    applyFilter();
  }

  // ========= Updating the state of the filter  =============

  void applyFilter() {
    var searchQuery = query.isEmpty
        ? []
        : [
            RecipeFilterModel(
                field: FirebaseFields.name,
                value: query,
                operator: 'fieldsContains'),
            // RecipeFilterModel(
            //     field: FirebaseFields.description,
            //     value: query,
            //     operator: 'fieldsContains'),
          ];

    var duration = [
      RecipeFilterModel(
          field: FirebaseFields.duration,
          value: durationFilter.state.start,
          operator: '>'),
      // RecipeFilterModel(
      //     field: FirebaseFields.duration,
      //     value: durationFilter.state.end,
      //     operator: '<'),
    ];
    var categories = List.generate(
        categoriesNotifier.state.selectedCategories.length,
        (index) => RecipeFilterModel(
            field: FirebaseFields.categoryId,
            value: categoriesNotifier.state.selectedCategories[index].id));

    state = RecipeFilters([...categories, ...duration, ...searchQuery]);
    log("Applied filters ${state.filters.length.toString()}");
  }
}
