import 'package:easy_cook/core/utils/app_images.dart';
import 'package:easy_cook/features/home/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class IngredientsItem extends StatelessWidget {
  const IngredientsItem({Key? key, required this.ingredient}) : super(key: key);
  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surfaceVariant),
            child: Image.asset(
              AppImages.vegeIcon,
              height: 25,
              width: 25,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              ingredient.name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            ingredient.quantity,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
