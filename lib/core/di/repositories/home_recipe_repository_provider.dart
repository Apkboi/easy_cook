import 'package:easy_cook/features/home/data/repositories/home_recipe_repository_impl.dart';
import 'package:easy_cook/features/home/dormain/repositories/HomeRecipeRepository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeRecipeRepositoryProvider =
    StateProvider<HomeRecipeRepository>((ref) => HomeRecipeRepositoryImpl());
