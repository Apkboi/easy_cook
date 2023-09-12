import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/core/navigation/route_paths.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: RecipeDetailsRoute.page, path: recipeDetailsScreen),
        AutoRoute(page: SettingsRoute.page, path: recipeDetailsScreen),
        AutoRoute(page: CookingRoute.page, path: cookingScreen),
        AutoRoute(page: DashBoardRoute.page, path: dashboard, children: [
          AutoRoute(page: HomeTab.page, initial: true, children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            // AutoRoute(page: RecipeDetailsRoute.page, path: recipeDetailsScreen),
          ]),
          AutoRoute(
              page: ProfileTab.page,
              children: [AutoRoute(page: ProfileRoute.page, initial: true)]),
          AutoRoute(
              page: BookmarkTab.page,
              children: [AutoRoute(page: BookmarkRoute.page, initial: true)]),
          AutoRoute(
              page: SearchTab.page,
              children: [AutoRoute(page: SearchRoute.page, initial: true)]),
        ]),
      ];
}
