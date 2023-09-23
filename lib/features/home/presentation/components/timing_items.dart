
import 'package:easy_cook/core/utils/app_utils.dart';
import 'package:easy_cook/features/home/data/models/step.dart';
import 'package:easy_cook/features/home/presentation/provider/cooking_timer_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimingItem extends ConsumerStatefulWidget {
  const TimingItem({Key? key, required this.isPlaying, required this.timing})
      : super(key: key);
  final Timing timing;
  final bool isPlaying;

  @override
  ConsumerState<TimingItem> createState() => _TimingItemState();
}

class _TimingItemState extends ConsumerState<TimingItem> {
  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(cookingTimerProvider);

    return Card(
      shape: RoundedRectangleBorder(
          side: timer.isRunning && timer.timingFor == widget.timing.timingFor
              ? BorderSide(color: Theme.of(context).colorScheme.primary)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(8)),
      surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
      color: Theme.of(context).colorScheme.background,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(FluentIcons.food_24_regular),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start ${widget.timing.timingFor}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${Duration(
                      minutes: widget.timing.durationInMinutes.round(),
                    ).inMinutes} mins',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            (!timer.isRunning)
                ? IconButton(
                    onPressed: () {
                      _play();
                    },
                    icon: Icon(FluentIcons.play_24_filled,
                        color: Theme.of(context).colorScheme.primary))
                : IconButton(
                    onPressed: () {
                      _pause();
                    },
                    icon: Icon(FluentIcons.pause_12_regular,
                        color: Theme.of(context).colorScheme.primary))
          ],
        ),
      ),
    );
  }

  void _play() {
    final timer = ref.watch(cookingTimerProvider);
    if (!timer.isRunning) {
      ref.watch(cookingTimerProvider.notifier).start(
          duration: widget.timing.durationInMinutes.round(),
          timingFor: widget.timing.timingFor);
      CustomSnackBar.show(context, body: const Text('Its not running'));
    }
  }

  void _pause() {
    ref.watch(cookingTimerProvider.notifier).pause();
  }
}
