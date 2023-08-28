import 'package:easy_cook/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
final appRouter = AppRouter();
class EasyCookApp extends StatelessWidget {
  const EasyCookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     routerConfig:appRouter.config(),

    );
  }
}