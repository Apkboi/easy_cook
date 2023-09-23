import 'package:easy_cook/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class NewRecipeWidget extends StatefulWidget {
  const NewRecipeWidget({Key? key}) : super(key: key);

  @override
  State<NewRecipeWidget> createState() => _NewRecipeWidgetState();
}

class _NewRecipeWidgetState extends State<NewRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              AppImages.vegeIcon,
              height: 60,
              width: 60,
              // fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'You have 12 recipes.json that you haven\'t \ntried yet ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'See Recipes',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
