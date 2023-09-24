import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/common/widgets/filled_textfield.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Welcome back\nto EASY cook',
                style: GoogleFonts.croissantOne(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter your credentials to continue',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(
                height: 25,
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
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Text('Don\'t have an account ?'),
                  TextButton(
                      onPressed: () {
                        context.router.replace(const SignupRoute());
                      },
                      child: const Text('Signup'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
