import 'package:easy_cook/common/models/categories.dart';
import 'package:easy_cook/features/home/presentation/notifiers/selected_categories_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchFilterCategoryProvider =
    StateNotifierProvider<SelectedCategoryNotifier, SelectedCategories>(
        (ref) => SelectedCategoryNotifier());
