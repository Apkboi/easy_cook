import 'package:easy_cook/common/notifiers/bookmark_action_notifier.dart';
import 'package:easy_cook/features/bookmark/presentation/provider/bookmarks_repo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookmarkActionProvider =
    StateNotifierProvider<BookmarkActionNotifier, dynamic>((ref) =>
        BookmarkActionNotifier(
            bookmarkRepository: ref.read(bookmarksRepoProvider)));
