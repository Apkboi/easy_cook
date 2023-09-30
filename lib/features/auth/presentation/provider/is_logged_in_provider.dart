import 'package:easy_cook/features/auth/presentation/notifiers/is_logged_in_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final isLoggedInProvider = StateProvider<bool>((ref) => false);
final isLoggedInProvider = StateNotifierProvider<IsLoggedInNotifier, bool>(
    (ref) => IsLoggedInNotifier());
