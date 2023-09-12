import 'package:auto_route/annotations.dart';
import 'package:easy_cook/features/home/presentation/components/cooking_step_item.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CookingScreen extends StatefulWidget {
  const CookingScreen({Key? key}) : super(key: key);

  @override
  State<CookingScreen> createState() => _CookingScreenState();
}

class _CookingScreenState extends State<CookingScreen> {
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spaghetti'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: pageController,
                itemBuilder: (context, index) => const CookingStepItem(),
              ),
            ),
            Column(
              children: [
                Center(
                    child: Text(
                  'step ${currentIndex + 1} of 11',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              switchStep(currentIndex - 1);
                            },
                            child: const Text('Previous'))),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(FluentIcons.pause_32_filled)),
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              switchStep(currentIndex + 1);
                            },
                            child: const Text('Next step'))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void switchStep(int index) {
    if (index <= 11 && index >= 0) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() {
        currentIndex = index;
      });
    }
  }
}
