import 'package:easy_cook/features/bookmark/dormain/repositories/bookmark_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkActionNotifier extends StateNotifier {
  BookmarkActionNotifier({required this.bookmarkRepository}) : super(null);

  final BookmarkRepository bookmarkRepository;

  void bookmarkRecipe({required String uid, required String recipeId}) async {
    await bookmarkRepository.bookMarkRecipe(uid: uid, recipeId: recipeId);
  }
}
