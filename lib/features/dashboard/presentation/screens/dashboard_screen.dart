import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/custom_bottom_nav.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeTab(), SearchTab(), BookmarkTab(), ProfileTab()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return CustomButtomNav(
          navItem: [
            NavItemModel(
              onTap: () {},
              icon: const Icon(FluentIcons.home_32_regular),
              selectedIcon: const Icon(FluentIcons.home_32_filled),
            ),
            NavItemModel(
              onTap: () {},
              icon: const Icon(FluentIcons.circle_32_regular),
              selectedIcon: const Icon(FluentIcons.circle_32_filled),
            ),
            NavItemModel(
              onTap: () {},
              icon: const Icon(FluentIcons.bookmark_32_regular),
              selectedIcon: const Icon(FluentIcons.bookmark_32_filled),
            ),
            NavItemModel(
              onTap: () {},
              icon: const Icon(FluentIcons.person_32_regular),
              selectedIcon: const Icon(FluentIcons.person_32_filled),
            ),
          ],
          onTap: (int index) {
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}
