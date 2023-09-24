import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/common/widgets/filled_textfield.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Create a new\naccount',
                style: GoogleFonts.croissantOne(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 25,
              ),
              FilledTextField(
                outline: true,
                hasElevation: false,
                preffix: const Icon(FluentIcons.person_24_regular),
                contentPadding: const EdgeInsets.all(20),
                hint: 'Full name',
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.1),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledTextField(
                outline: true,
                hasElevation: false,
                preffix: const Icon(FluentIcons.mail_24_regular),
                contentPadding: const EdgeInsets.all(20),
                hint: 'Email',
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.1),
              ),
              const SizedBox(
                height: 20,
              ),
              FilledTextField(
                outline: true,
                hasElevation: false,
                preffix: const Icon(FluentIcons.lock_closed_key_24_regular),
                contentPadding: const EdgeInsets.all(20),
                hint: 'Password',
                obscured: true,
                fillColor: Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.1),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                onPressed: () {},
                padding: const EdgeInsets.all(20),
                child: const Text('Create Account'),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Text('Already have an account ?'),
                  TextButton(
                      onPressed: () {
                        context.router.push(const LoginRoute());
                      },
                      child: const Text('Login'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
