import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/features/home/presentation/notifiers/recipe_filter_notifier.dart';
import 'package:easy_cook/features/home/presentation/notifiers/search_duration_filter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CookingTimeDuration extends ConsumerStatefulWidget {
  const CookingTimeDuration(
      {Key? key, required this.filterNotifier, required this.durationProvider})
      : super(key: key);
  final RecipesFilterNotifier filterNotifier;
  final StateNotifierProvider<SearchDurationFilter, RangeValues>
      durationProvider;

  @override
  ConsumerState<CookingTimeDuration> createState() =>
      _CookingTimeDurationState();
}

class _CookingTimeDurationState extends ConsumerState<CookingTimeDuration> {
  @override
  Widget build(BuildContext context) {
    final selectedDuration = ref.watch(widget.durationProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by cooking time',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        SliderTheme(
          data: SliderThemeData(thumbShape: SliderComponentShape.noThumb),
          child: RangeSlider(
            onChangeStart: (val) {},
            values: selectedDuration,
            onChanged: (val) {
              ref.read(widget.durationProvider.notifier).updateDuration(val);
            },
            min: 2,
            max: 120,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
            child: Text(
          '${selectedDuration.start.round()} - ${selectedDuration.end.round()} minutes',
          style: Theme.of(context).textTheme.titleLarge,
        )),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Apply filter'),
                SizedBox(
                  width: 10,
                ),
                Icon(FluentIcons.options_20_regular)
              ],
            ),
            onPressed: () {
              _applyFilter();

            }),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  void _applyFilter() {
    widget.filterNotifier.applyFilter();
    context.router.pop(true);
  }
}
