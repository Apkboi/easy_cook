import 'dart:convert';

import 'package:easy_cook/core/constants/storage_keys.dart';
import 'package:easy_cook/core/helpers/storage_helper.dart';
import 'package:easy_cook/features/auth/data/models/app_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserCacheNotifier extends StateNotifier<AppUser?> {
  UserCacheNotifier() : super(null);

  AppUser? cachedUser;

  void cacheUser(AppUser user) async {
    StorageHelper.setString(StorageKeys.cachedUser, jsonEncode(user.toJson()));
    getCachedUser();
  }

  Future<void> getCachedUser() async {
    final userMap = await StorageHelper.getString(StorageKeys.cachedUser);
    if (userMap != null) {
      cachedUser = AppUser.fromJson(jsonDecode(userMap));
      state = cachedUser;
    }
  }
}
