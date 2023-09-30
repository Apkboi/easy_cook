import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';

part 'bookmark_model.g.dart';

@freezed
class BookmarkModel with _$BookmarkModel {
  factory BookmarkModel({
    required String bookmarkedBy,
    required dynamic recipeId,
    required DateTime date,
  }) = _BookmarkModel;

  factory BookmarkModel.fromJson(Map<String, Object?> json) =>
      _$BookmarkModelFromJson(json);
}
