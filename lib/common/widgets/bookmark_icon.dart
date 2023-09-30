import 'package:easy_cook/common/provider/has_bookmarked_provider.dart';
import 'package:easy_cook/common/widgets/circular_loader.dart';
import 'package:easy_cook/features/bookmark/presentation/provider/bookmark_action_notifier_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkIcon extends ConsumerStatefulWidget {
  const BookmarkIcon(this.recipeId,
      {this.bookMarkedColor,
      this.unBookMarkedColor,
      this.buttonStyle,
      Key? key})
      : super(key: key);
  final String recipeId;
  final Color? bookMarkedColor;
  final Color? unBookMarkedColor;
  final ButtonStyle? buttonStyle;

  @override
  ConsumerState<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends ConsumerState<BookmarkIcon> {
  final User? loggedInUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final isBookmarked = ref.watch(hasBookMarkedProvider(widget.recipeId));
    return isBookmarked.when(data: (data) {
      return IconButton(
          style: widget.buttonStyle,
          onPressed: () {
            ref.read(bookmarkActionProvider.notifier).bookmarkRecipe(
                uid: loggedInUser?.uid ?? '', recipeId: widget.recipeId);
          },
          icon: Icon(
            FluentIcons.bookmark_28_filled,
            color: data
                ? widget.bookMarkedColor ??
                    Theme.of(context).colorScheme.primary
                : widget.unBookMarkedColor ?? Colors.white,
          ));
    }, error: (e, stack) {
      return Container();
    }, loading: () {
      return const CircularLoader(
        size: 5,
      );
    });
  }
}
