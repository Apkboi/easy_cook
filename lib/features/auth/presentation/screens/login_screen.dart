import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_cook/common/widgets/circular_loader.dart';
import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/common/widgets/filled_textfield.dart';
import 'package:easy_cook/core/constants/storage_keys.dart';
import 'package:easy_cook/core/helpers/storage_helper.dart';
import 'package:easy_cook/core/navigation/app_router.gr.dart';
import 'package:easy_cook/core/utils/app_utils.dart';
import 'package:easy_cook/features/auth/data/models/auth_state.dart';
import 'package:easy_cook/features/auth/dormain/models/login_payload.dart';
import 'package:easy_cook/features/auth/presentation/provider/auth_notifier_provider.dart';
import 'package:easy_cook/features/auth/presentation/provider/is_logged_in_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // late AuthState authState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                  controller: _emailController,
                  preffix: const Icon(FluentIcons.mail_24_regular),
                  contentPadding: const EdgeInsets.all(20),
                  hint: 'Email',
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Enter Email'),
                    EmailValidator(errorText: 'Invalid Email')
                  ]),
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
                  controller: _passwordController,
                  preffix: const Icon(FluentIcons.lock_closed_key_24_regular),
                  contentPadding: const EdgeInsets.all(20),
                  hint: 'Password',
                  obscured: true,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Enter Password'),
                    MinLengthValidator(8,
                        errorText: "Email must be up to 8 characters")
                  ]),
                  fillColor: Theme.of(context)
                      .colorScheme
                      .surfaceVariant
                      .withOpacity(0.1),
                ),
                const SizedBox(
                  height: 25,
                ),
                Consumer(builder: (context, ref, child) {
                  final authState = ref.watch(authNotifierProvider);

                  return CustomButton(
                    onPressed: authState.authStatus == AuthStatus.loading
                        ? null
                        : () {
                            _login(
                              ref,
                            );
                          },
                    padding: const EdgeInsets.all(20),
                    child: authState.authStatus == AuthStatus.loading
                        ? const CircularLoader(
                            size: 20,
                          )
                        : const Text('Login'),
                  );
                }),
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
      ),
    );
  }

  void _login(
    WidgetRef ref,
  ) async {
    if (_formKey.currentState!.validate()) {
      await ref.read(authNotifierProvider.notifier).loginUser(
          loginPayload: LoginPayLoad(
              email: _emailController.text,
              password: _passwordController.text));

      _listenToAuthStates(ref);
    }
  }

  Future<void> _listenToAuthStates(WidgetRef ref) async {
    if (ref.read(authNotifierProvider).authStatus == AuthStatus.authenticated) {
      var loggedInAnonyMously = await StorageHelper.getBoolean(
          StorageKeys.loggedInAnonymously, false);

      if (loggedInAnonyMously) {
        context.router.pop();
      } else {
        context.router.push(const DashBoardRoute());
        CustomSnackBar.showSuccess(context,
            message: "User logged in successfully", action: () {});
      }

      ref.read(isLoggedInProvider.notifier).refreshAuthState();

      ref.invalidate(authNotifierProvider);
    }
    if (ref.read(authNotifierProvider).error != null) {
      CustomSnackBar.showError(context,
          message: ref.read(authNotifierProvider).error!, action: () {});
    }
  }
}
