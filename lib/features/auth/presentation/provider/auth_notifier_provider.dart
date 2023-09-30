import 'dart:developer';

import 'package:easy_cook/common/provider/user_cache_provider.dart';
import 'package:easy_cook/features/auth/data/models/auth_state.dart';
import 'package:easy_cook/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:easy_cook/features/auth/presentation/provider/auth_repo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>((ref) {
  ref.onDispose(() {
    log('disposed');
  });
  return AuthNotifier(
      authRepository: ref.watch(authRepoProvider),
      userCacheNotifier: ref.watch(userCacheProvider.notifier));
});
