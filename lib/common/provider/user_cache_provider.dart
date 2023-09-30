import 'package:easy_cook/common/notifiers/user_cache_notifier.dart';
import 'package:easy_cook/features/auth/data/models/app_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final userCacheProvider = StateNotifierProvider<UserCacheNotifier, AppUser?>(
    (ref) => UserCacheNotifier());
