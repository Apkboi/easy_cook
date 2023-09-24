import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_cook/common/models/recipe_filters_model.dart';
import 'package:easy_cook/core/constants/firebase/firebase_operators.dart';

extension FireBaseQueryExtension on Query<Map<String, dynamic>> {
  Query<Map<String, dynamic>> applyFilters(
      {required List<RecipeFilterModel> filters}) {
    Query<Map<String, dynamic>> query = this;

    for (RecipeFilterModel filter in filters) {
      switch (filter.operator) {
        case null:
          break;
        case FirebaseOperators.greaterThan:
          query = query.where(filter.field, isGreaterThan: filter.value);
          break;
        case FirebaseOperators.equalsTo:
          query = query.where(filter.field, isEqualTo: filter.value);
          break;
        case FirebaseOperators.lessThan:
          query = query.where(filter.field, isLessThan: filter.value);
          break;
        case FirebaseOperators.arrayContains:
          query = query.where(filter.field, arrayContains: filter.value);
          break;
        case FirebaseOperators.wherein:
          query = query.where(filter.field, whereIn: filter.value);
          break;
        case FirebaseOperators.isGreaterThanOrEqualTo:
          query =
              query.where(filter.field, isGreaterThanOrEqualTo: filter.value);
          break;
        case FirebaseOperators.inNull:
          query = query.where(filter.field, isNull: filter.value);
          break;
        case FirebaseOperators.isNotEqualTo:
          query = query.where(filter.field, isNotEqualTo: filter.value);
          break;
        case FirebaseOperators.whereNotIn:
          query = query.where(filter.field, whereNotIn: filter.value);
          break;
        case FirebaseOperators.arrayContainsAny:
          query = query.where(filter.field, arrayContainsAny: filter.value);
          break;
      }
    }

    return query;
  }
}
