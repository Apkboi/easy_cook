import 'package:easy_cook/core/navigation/app_router.dart';
import 'package:easy_cook/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

final appRouter = AppRouter();

class EasyCookApp extends StatelessWidget {
  const EasyCookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
