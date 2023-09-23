import 'dart:developer';
import 'package:easy_cook/common/models/categories.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedCategoryNotifier extends StateNotifier<SelectedCategories> {
  SelectedCategoryNotifier() : super(SelectedCategories([]));

  List<RecipeCategory> _selectedCategories = [];

  List<RecipeCategory> get selectedCategories => _selectedCategories;

  void selectCategory(
    RecipeCategory category,
  ) {
    var sameCategory = [];
    for (var cat in _selectedCategories) {
      if (cat.id == category.id) {
        sameCategory.add(cat);
      }
    }
    if (sameCategory.isNotEmpty) {
      _selectedCategories.removeWhere((element) => element.id == category.id);
      state = SelectedCategories(_selectedCategories);
      log('contains category');
    } else {
      _selectedCategories.add(category);
      state = SelectedCategories(_selectedCategories);
      log('category added');
    }
  }

  void removeById(String name) {

    _selectedCategories.removeWhere((element) => element.name == name);
    state = SelectedCategories(_selectedCategories);

  }
}
