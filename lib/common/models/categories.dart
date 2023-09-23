import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories.freezed.dart';
part 'categories.g.dart';

@freezed
class RecipeCategory with _$RecipeCategory {
  const factory RecipeCategory({
    required String id,
    required dynamic imageUrl,
    required String name,
  }) = _Category;

  factory RecipeCategory.fromJson(Map<String, Object?> json) =>
      _$RecipeCategoryFromJson(json);

  factory RecipeCategory.all() => const RecipeCategory(id: '', imageUrl: 'image_url', name: 'All');

  @override
  bool operator ==(Object other) {
    return (other is RecipeCategory) && (other).id == id;
  }
}



class SelectedCategories {

  final List<RecipeCategory> selectedCategories;
  SelectedCategories(this.selectedCategories);

}
