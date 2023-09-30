import 'package:easy_cook/common/provider/user_cache_provider.dart';
import 'package:easy_cook/core/navigation/app_router.dart';
import 'package:easy_cook/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouter = AppRouter();

class EasyCookApp extends ConsumerWidget {
  const EasyCookApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    ref.read(userCacheProvider.notifier).getCachedUser();

    return MaterialApp.router(
      // themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
