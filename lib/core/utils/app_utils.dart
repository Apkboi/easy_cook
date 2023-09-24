import 'dart:ui';

import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:easy_cook/common/widgets/custom_outlined_button.dart';
import 'package:easy_cook/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

void showConfirmDialog(BuildContext context,
    {String? tittle,
    String? subtitle,
    String? confirmButtonText,
    String? cancelButtonText,
    required VoidCallback? onDismiss,
    required VoidCallback? onConfirm}) {
  showDialog(
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
      child: AlertDialog(

          backgroundColor: Theme.of(context).cardTheme.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20,),
              Text(
                tittle ?? 'Are you sure you want to exit ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                subtitle ?? 'Subtitle here',
                textAlign: TextAlign.center,
                style: const TextStyle(color: darkGrey, fontSize: 13),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedButton(
                        padding: const EdgeInsets.all(10),
                        onPressed: () {
                          Navigator.pop(context);
                          onDismiss!();
                        },
                        child: const Text(
                          'Cancel',
                        )),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomButton(
                        padding: const EdgeInsets.all(10),
                        onPressed: () {
                          Navigator.pop(context);
                          onConfirm!();
                        },
                        child: const Text(
                          'Continue',
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20,),

            ],
          )),
    ),
  );
}

class CustomSnackBar {
  final BuildContext context;

  CustomSnackBar({required this.context});

  CustomSnackBar.showMessage(
    this.context, {
    required String message,
    Function? action,
    String? actionMessage,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action,
              textColor: Colors.white,
            ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor:
          backgroundColor ?? backgroundColor ?? const Color(0xFF383737),
      content: Text(
        message,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CustomSnackBar.show(
    this.context, {
    required Widget body,
    Function? action,
    String? actionMessage,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(18),
      duration: const Duration(seconds: 5),
      dismissDirection: DismissDirection.horizontal,
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action,
              textColor: Colors.white,
            ),
      backgroundColor: backgroundColor ?? backgroundColor ?? Colors.black,
      content: body,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  CustomSnackBar.showError(
    this.context, {
    required String message,
    Function? action,
    String? actionMessage,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action,
              textColor: Colors.white,
            ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: backgroundColor ?? backgroundColor ?? Colors.red,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,

          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CustomSnackBar.showSuccess(
    this.context, {
    required String message,
    Function? action,
    String? actionMessage,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      action: action == null
          ? null
          : SnackBarAction(
              label: actionMessage ?? "OK",
              onPressed: () => action,
              textColor: Colors.white,
            ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: backgroundColor ?? backgroundColor ?? Colors.green,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
