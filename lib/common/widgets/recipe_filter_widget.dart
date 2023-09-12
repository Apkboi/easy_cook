import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/features/bookmark/presentation/components/bookmark_filter_widget.dart';
import 'package:easy_cook/features/bookmark/presentation/components/category_filter_selector.dart';
import 'package:easy_cook/features/bookmark/presentation/components/cooking_time_duration.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class RecipeFilterWidget extends StatefulWidget {
  const RecipeFilterWidget({Key? key}) : super(key: key);

  @override
  State<RecipeFilterWidget> createState() => _RecipeFilterWidgetState();
}

class _RecipeFilterWidgetState extends State<RecipeFilterWidget> {
  Widget selectedFilterWidget = Container();
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 60,
            ),
            AnimatedCrossFade(
                firstChild: _SelectFilterKeyWidget(
                  onKeySelected: (key) {
                    _switchCrossFade(key);
                  },
                ),
                secondChild: selectedFilterWidget,
                crossFadeState: crossFadeState,
                duration: const Duration(milliseconds: 400))
          ],
        ),
      ),
    );
  }

  void _switchCrossFade(String key) {
    setState(() {
      switch (key) {
        case 'category':
          selectedFilterWidget = const CategoryFilterSelector();
          break;
        case 'cooking time':
          selectedFilterWidget = const CookingTimeDuration();
          break;
      }
      crossFadeState = CrossFadeState.showSecond;
    });
  }
}

class _SelectFilterKeyWidget extends StatefulWidget {
  const _SelectFilterKeyWidget({Key? key, required this.onKeySelected})
      : super(key: key);
  final Function(String key) onKeySelected;

  @override
  State<_SelectFilterKeyWidget> createState() => _SelectFilterKeyWidgetState();
}

class _SelectFilterKeyWidgetState extends State<_SelectFilterKeyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Filter search',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  // color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        FilterOption(
          filterKey: 'category',
          iconData: FluentIcons.food_24_regular,
          onSelected: () {
            widget.onKeySelected('category');
          },
        ),
        // const SizedBox(
        //   height: 16,
        // ),
        // FilterOption(
        //   filterKey: 'date',
        //   iconData: FluentIcons.calendar_empty_20_regular,
        //   onSelected: () {
        //     widget.onKeySelected('date');
        //   },
        // ),
        const SizedBox(
          height: 16,
        ),
        FilterOption(
          filterKey: 'cooking time',
          iconData: FluentIcons.timer_10_20_regular,
          onSelected: () {
            widget.onKeySelected('cooking time');
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
            child: const Text('Cancel'),
            onPressed: () {
              // context.router.
            }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
