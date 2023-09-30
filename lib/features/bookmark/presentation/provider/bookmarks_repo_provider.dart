import 'package:easy_cook/features/bookmark/data/repositories/bookmark_repository_impl.dart';
import 'package:easy_cook/features/bookmark/dormain/repositories/bookmark_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookmarksRepoProvider =
    StateProvider<BookmarkRepository>((ref) => BookmarkRepositoryImpl());
