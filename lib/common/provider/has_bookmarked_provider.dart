import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_cook/core/constants/firebase/firebase_collections.dart';
import 'package:easy_cook/core/constants/firebase/firebase_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hasBookMarkedProvider =
    StreamProvider.family<bool, String>((ref, recipeId) {
  User? user = FirebaseAuth.instance.currentUser;

  return FirebaseFirestore.instance
      .collection(FirebaseCollections.bookmarks)
      .where(
        FirebaseFields.bookmarkedBy,
        isEqualTo: user?.uid,
      )
      .where(FirebaseFields.recipeId, isEqualTo: recipeId)
      .limit(1)
      .snapshots()
      .map((event) {
    return event.docs.isNotEmpty;
  });
});
