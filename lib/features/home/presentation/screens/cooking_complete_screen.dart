import 'package:auto_route/annotations.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/common/widgets/custom_outlined_button.dart';
import 'package:easy_cook/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CookingCompleteScreen extends StatefulWidget {
  const CookingCompleteScreen({Key? key}) : super(key: key);

  @override
  State<CookingCompleteScreen> createState() => _CookingCompleteScreenState();
}

class _CookingCompleteScreenState extends State<CookingCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/pngs/happy1.png',
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ' 👏🌟🌟🌟👏\nCongratulations',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'You just completed this cooking session,\nhope it came out well',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: darkGrey),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(
                  padding: const EdgeInsets.all(18.0),
                  child: const Text('Continue'),
                  onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomOutlinedButton(
                  padding: const EdgeInsets.all(18.0),
                  outlinedColr: Theme.of(context).colorScheme.primary,
                  foreGroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  child: const Text('Make a Review')),
            ),
          ],
        ),
      ),
    );
  }
}
