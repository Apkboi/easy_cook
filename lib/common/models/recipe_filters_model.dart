import 'package:easy_cook/core/constants/firebase/firebase_operators.dart';
import 'package:equatable/equatable.dart';

typedef CRecipeFilters = List<RecipeFilterModel>;

class RecipeFilterModel extends Equatable {
  final String field;
  final dynamic value;
  final FirebaseOperators? operator;

  const RecipeFilterModel(
      {required this.field,
      required this.value,
      this.operator = FirebaseOperators.equalsTo});

  @override
  List<Object?> get props => [field, value, operator];
}

class RecipeFilters extends Equatable {
  final List<RecipeFilterModel> filters;

  RecipeFilters(this.filters);

  @override
  List<Object?> get props => [filters];
}
