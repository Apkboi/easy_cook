import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/core/utils/app_utils.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:easy_cook/features/home/data/models/step.dart';
import 'package:easy_cook/features/home/presentation/components/cooking_step_item.dart';
import 'package:easy_cook/features/home/presentation/provider/cooking_steps_provider.dart';
import 'package:easy_cook/features/home/presentation/provider/cooking_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CookingScreen extends ConsumerStatefulWidget {
  const CookingScreen({Key? key, required this.recipe}) : super(key: key);
  final RecipeModel recipe;

  @override
  ConsumerState<CookingScreen> createState() => _CookingScreenState();
}

class _CookingScreenState extends ConsumerState<CookingScreen> {
  final pageController = PageController();
  int currentIndex = 0;
  int steplength = 0;

  @override
  Widget build(BuildContext context) {
    final steps = ref.watch(cookingStepsProvider(widget.recipe.id));

    log((widget.recipe.id).toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              child: TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.05),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      shape: const StadiumBorder(),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground)),
                  onPressed: () {},
                  child: Text(
                    'step ${currentIndex + 1} of ${steplength}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  )),
            ),
          )
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: steps.when(
        data: (data) {
          steplength = data.length;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: data.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => CookingStepItem(
                      recipe: widget.recipe,
                      step: data.toList()[index],
                    ),
                  ),
                ),
                Column(
                  children: [
                    _footer(data),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  void switchStep(int index, int max) {
    final timer = ref.watch(cookingTimerProvider);

    if (timer.isRunning) {
      showConfirmDialog(context, onDismiss: () {}, onConfirm: () {
        ref.watch(cookingTimerProvider.notifier).reset();
      },
          subtitle: 'There is a timer currently running',
          tittle: "Do you want to stop the current timer ?");
    } else {
      ref.watch(cookingTimerProvider.notifier).reset();
      if (index + 1 <= max && index >= 0) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        setState(() {
          currentIndex = index;
        });
      }
    }
  }

  _footer(Iterable<CookingStep> data) {
    return Row(
      children: [
        Expanded(
            child: TextButton(
                onPressed: (currentIndex + 1) > 1
                    ? () {
                        switchStep(currentIndex - 1, data.length);
                      }
                    : null,
                child: const Text('Previous'))),
        const SizedBox(
          width: 16,
        ),
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(FluentIcons.pause_32_filled)),
        Expanded(
            child: TextButton(
                onPressed: () {
                  if (currentIndex + 1 == data.length) {
                    context.router.replace(const CookingCompleteRoute());
                  } else {
                    switchStep(currentIndex + 1, data.length);
                  }
                },
                child: Text(currentIndex + 1 == data.length
                    ? "Complete"
                    : 'Next step'))),
      ],
    );
  }
}
