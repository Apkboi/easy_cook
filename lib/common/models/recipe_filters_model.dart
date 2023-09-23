import 'package:equatable/equatable.dart';


typedef CRecipeFilters = List<RecipeFilterModel>;


class RecipeFilterModel extends Equatable {
  final String field;
  final dynamic value;
  final String? operator;

  const RecipeFilterModel(
      {required this.field, required this.value, this.operator = '=='});

  @override
  List<Object?> get props => [field, value, operator];
}


class RecipeFilters extends Equatable {
  final List<RecipeFilterModel> filters;

  RecipeFilters(this.filters);

  @override
  List<Object?> get props => [filters];
}
