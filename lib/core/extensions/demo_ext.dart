// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_cook/common/models/recipe_filters_model.dart';
// import 'package:easy_cook/core/constants/firebase/firebase_operators.dart';
//
// extension FireBaseQueryExtension on Query<Map<String, dynamic>> {
//   Query<Map<String, dynamic>> applyFilters(
//       {required List<FilterModel> filters}) {
//     Query<Map<String, dynamic>> tempQuery = this;
//
//     for (FilterModel filter in filters) {
//       switch (filter.operator) {
//         case FilterOperators.greaterThan:
//           tempQuery = tempQuery.where(filter.field, isGreaterThan: filter.value);
//           break;
//         case FilterOperators.equalsTo:
//           tempQuery = tempQuery.where(filter.field, isEqualTo: filter.value);
//           break;
//         case FilterOperators.lessThan:
//           tempQuery = tempQuery.where(filter.field, isLessThan: filter.value);
//           break;
//         case FilterOperators.arrayContains:
//           tempQuery = tempQuery.where(filter.field, arrayContains: filter.value);
//           break;
//         case FilterOperators.wherein:
//           tempQuery = tempQuery.where(filter.field, whereIn: filter.value);
//           break;
//
//       }
//     }
//
//     return tempQuery;
//   }
// }
//
//
//
//
//
//
// // Query Function That Accepts a list of filter mo
// Stream<QuerySnapshot> queryFirestoreWithCompoundFilters(List<FilterModel> filters) {
//   CollectionReference itemsCollection = FirebaseFirestore.instance.collection(
//       'items');
//
//   Query query = itemsCollection;
//
//
//
//     for (FilterModel filter in filters) {
//       switch (filter.operator) {
//         case FilterOperator.greaterThan:
//           tempQuery = tempQuery
//               .where(filter.field, isGreaterThan: filter.value);
//           break;
//         case FilterOperator.equalsTo:
//           tempQuery = tempQuery
//               .where(filter.field, isEqualTo: filter.value);
//           break;
//         case FilterOperator.lessThan:
//           tempQuery = tempQuery
//               .where(filter.field, isLessThan: filter.value);
//           break;
//         case FilterOperator.arrayContains:
//           tempQuery = tempQuery
//               .where(filter.field, arrayContains: filter.value);
//           break;
//       // More conditions for more operators
//       }
//
//       query = tempQuery;
//
//
//     return query.snapshots();
//   }
// }
//
