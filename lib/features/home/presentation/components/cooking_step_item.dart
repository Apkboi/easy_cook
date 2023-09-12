import 'package:easy_cook/core/utils/app_images.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
class CookingStepItem extends StatefulWidget {
  const CookingStepItem({Key? key}) : super(key: key);

  @override
  State<CookingStepItem> createState() => _CookingStepItemState();
}

class _CookingStepItemState extends State<CookingStepItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 30,
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  value: 0.7,
                ),
              ),
              SizedBox(
                  child: Image.asset(
                    AppImages.vegeIcon,
                    height: 120,
                    width: 120,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            '00 : 30',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 30
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            'Add olive oil to our sauce',
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
            'While the pasta is cooking, go and get an onion and pill it and add, start cutting it into small peices.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
