import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:easy_cook/features/home/data/models/step.dart';
import 'package:easy_cook/features/home/presentation/components/timing_items.dart';
import 'package:easy_cook/features/home/presentation/provider/cooking_timer_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CookingStepItem extends ConsumerStatefulWidget {
  const CookingStepItem({
    Key? key,
    required this.recipe,
    required this.step,
  }) : super(key: key);
  final RecipeModel recipe;

  final CookingStep step;

  @override
  ConsumerState<CookingStepItem> createState() => _CookingStepItemState();
}

class _CookingStepItemState extends ConsumerState<CookingStepItem> {
  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(cookingTimerProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FluentIcons.play_32_regular),
                  SizedBox(
                    width: 10,
                  ),
                  Text('tutorial')
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          // Center(
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       const SizedBox(
          //         height: 200,
          //         width: 200,
          //         child: CircularProgressIndicator(
          //           value: 0.7,
          //         ),
          //       ),
          //       SizedBox(
          //           child: Text(
          //         '${(timer.duration / 60).toInt().toString().padLeft(2, '0')} : ${(timer.duration % 60).toString().padLeft(2, '0')}',
          //         style: Theme.of(context).textTheme.titleLarge?.copyWith(
          //               fontWeight: FontWeight.w600,
          //               fontSize: 25,
          //               color: Theme.of(context).colorScheme.primary,
          //             ),
          //       ))
          //     ],
          //   ),
          // ),

          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.recipe.images.first,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                )),
          )),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: const StadiumBorder(),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                onPressed: () {},
                child: Text(
                  '${(timer.duration / 60).toInt().toString().padLeft(2, '0')} : ${(timer.duration % 60).toString().padLeft(2, '0')}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              widget.step.tittle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),

          Center(
            child: Text(
              widget.step.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Process',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),

          ...List.generate(
            widget.step.timing.length,
            (index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: TimingItem(
                isPlaying: index == 0,
                timing: widget.step.timing[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
