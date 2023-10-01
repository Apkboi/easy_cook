// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:easy_cook/features/auth/presentation/screens/login_screen.dart'
    as _i8;
import 'package:easy_cook/features/auth/presentation/screens/onboarding_screen.dart'
    as _i9;
import 'package:easy_cook/features/auth/presentation/screens/signup_screen.dart'
    as _i16;
import 'package:easy_cook/features/bookmark/presentation/screens/bookmark_screen.dart'
    as _i1;
import 'package:easy_cook/features/bookmark/presentation/screens/bookmark_tab.dart'
    as _i2;
import 'package:easy_cook/features/dashboard/presentation/screens/dashboard_screen.dart'
    as _i5;
import 'package:easy_cook/features/home/data/models/recipe_model.dart' as _i19;
import 'package:easy_cook/features/home/presentation/screens/cooking_complete_screen.dart'
    as _i3;
import 'package:easy_cook/features/home/presentation/screens/cooking_screen.dart'
    as _i4;
import 'package:easy_cook/features/home/presentation/screens/home_screen.dart'
    as _i6;
import 'package:easy_cook/features/home/presentation/screens/home_tab.dart'
    as _i7;
import 'package:easy_cook/features/home/presentation/screens/recipe_details_screen.dart'
    as _i12;
import 'package:easy_cook/features/profile/presentation/screens/profile_screen.dart'
    as _i10;
import 'package:easy_cook/features/profile/presentation/screens/profile_tab.dart'
    as _i11;
import 'package:easy_cook/features/profile/presentation/screens/settings_screen.dart'
    as _i15;
import 'package:easy_cook/features/search/presentation/screens/search_screen.dart'
    as _i13;
import 'package:easy_cook/features/search/presentation/screens/search_tab.dart'
    as _i14;
import 'package:flutter/material.dart' as _i18;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    BookmarkRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookmarkScreen(),
      );
    },
    BookmarkTab.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BookmarkTab(),
      );
    },
    CookingCompleteRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CookingCompleteScreen(),
      );
    },
    CookingRoute.name: (routeData) {
      final args = routeData.argsAs<CookingRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CookingScreen(
          key: args.key,
          recipe: args.recipe,
        ),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashBoardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    HomeTab.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeTab(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnboardingScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileScreen(),
      );
    },
    ProfileTab.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileTab(),
      );
    },
    RecipeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailsRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.RecipeDetailsScreen(
          key: args.key,
          recipe: args.recipe,
          heroTag: args.heroTag,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SearchScreen(),
      );
    },
    SearchTab.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SearchTab(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SettingsScreen(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SignupScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookmarkScreen]
class BookmarkRoute extends _i17.PageRouteInfo<void> {
  const BookmarkRoute({List<_i17.PageRouteInfo>? children})
      : super(
          BookmarkRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BookmarkTab]
class BookmarkTab extends _i17.PageRouteInfo<void> {
  const BookmarkTab({List<_i17.PageRouteInfo>? children})
      : super(
          BookmarkTab.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkTab';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CookingCompleteScreen]
class CookingCompleteRoute extends _i17.PageRouteInfo<void> {
  const CookingCompleteRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CookingCompleteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CookingCompleteRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CookingScreen]
class CookingRoute extends _i17.PageRouteInfo<CookingRouteArgs> {
  CookingRoute({
    _i18.Key? key,
    required _i19.RecipeModel recipe,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CookingRoute.name,
          args: CookingRouteArgs(
            key: key,
            recipe: recipe,
          ),
          initialChildren: children,
        );

  static const String name = 'CookingRoute';

  static const _i17.PageInfo<CookingRouteArgs> page =
      _i17.PageInfo<CookingRouteArgs>(name);
}

class CookingRouteArgs {
  const CookingRouteArgs({
    this.key,
    required this.recipe,
  });

  final _i18.Key? key;

  final _i19.RecipeModel recipe;

  @override
  String toString() {
    return 'CookingRouteArgs{key: $key, recipe: $recipe}';
  }
}

/// generated route for
/// [_i5.DashBoardScreen]
class DashBoardRoute extends _i17.PageRouteInfo<void> {
  const DashBoardRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeTab]
class HomeTab extends _i17.PageRouteInfo<void> {
  const HomeTab({List<_i17.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnboardingScreen]
class OnboardingRoute extends _i17.PageRouteInfo<void> {
  const OnboardingRoute({List<_i17.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileRoute extends _i17.PageRouteInfo<void> {
  const ProfileRoute({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileTab]
class ProfileTab extends _i17.PageRouteInfo<void> {
  const ProfileTab({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RecipeDetailsScreen]
class RecipeDetailsRoute extends _i17.PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({
    _i18.Key? key,
    required _i19.RecipeModel recipe,
    required String heroTag,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          RecipeDetailsRoute.name,
          args: RecipeDetailsRouteArgs(
            key: key,
            recipe: recipe,
            heroTag: heroTag,
          ),
          initialChildren: children,
        );

  static const String name = 'RecipeDetailsRoute';

  static const _i17.PageInfo<RecipeDetailsRouteArgs> page =
      _i17.PageInfo<RecipeDetailsRouteArgs>(name);
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({
    this.key,
    required this.recipe,
    required this.heroTag,
  });

  final _i18.Key? key;

  final _i19.RecipeModel recipe;

  final String heroTag;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{key: $key, recipe: $recipe, heroTag: $heroTag}';
  }
}

/// generated route for
/// [_i13.SearchScreen]
class SearchRoute extends _i17.PageRouteInfo<void> {
  const SearchRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SearchTab]
class SearchTab extends _i17.PageRouteInfo<void> {
  const SearchTab({List<_i17.PageRouteInfo>? children})
      : super(
          SearchTab.name,
          initialChildren: children,
        );

  static const String name = 'SearchTab';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignupScreen]
class SignupRoute extends _i17.PageRouteInfo<void> {
  const SignupRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
