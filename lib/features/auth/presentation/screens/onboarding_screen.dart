import 'dart:developer';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/common/widgets/custom_outlined_button.dart';
import 'package:easy_cook/core/constants/storage_keys.dart';
import 'package:easy_cook/core/helpers/storage_helper.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/core/utils/app_images.dart';
import 'package:easy_cook/features/auth/presentation/provider/auth_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(authNotifierProvider);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.pizza1,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.7),
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ])),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(),
                  Text(
                    'Cooking a \nDelicious Food\nEasily.',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Discover more than 1200 food\nrecipes in your hands and cooking\nit easily.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          gradient: LinearGradient(
                              end: Alignment.topRight,
                              begin: Alignment.bottomLeft,
                              colors: [
                                Theme.of(context).colorScheme.primary,

                                // Theme.of(context).colorScheme.primary.withOpacity(opacity),
                                // Colors.greenAccent,
                                Colors.greenAccent,
                              ])),
                      child: CustomButton(
                          // bgColor: ,
                          padding: const EdgeInsets.all(20),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(17),
                          bgColor: Colors.transparent,
                          child: Text(
                            'Sign in',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            context.router.push(const SignupRoute());
                          })),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomOutlinedButton(
                    onPressed: () {
                      StorageHelper.setBoolean(
                          StorageKeys.loggedInAnonymously, true);
                      context.router.push(const DashBoardRoute());
                    },
                    outlinedColr: Theme.of(context).colorScheme.primary,
                    foreGroundColor: Colors.white,
                    padding: const EdgeInsets.all(20),
                    radius: 17,
                    child: const Text('Start cooking'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {

    log('UI DISPOSED');

    super.dispose();
  }
}
