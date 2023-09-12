import 'package:easy_cook/core/utils/app_images.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BookmarkedRecipe extends StatefulWidget {
  const BookmarkedRecipe({Key? key}) : super(key: key);

  @override
  State<BookmarkedRecipe> createState() => _BookmarkedRecipeState();
}

class _BookmarkedRecipeState extends State<BookmarkedRecipe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                AppImages.spag,
                fit: BoxFit.cover,
                height: 170,
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 4,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Noodles and chicken',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FluentIcons.bookmark_32_filled,
                            color: Theme.of(context).colorScheme.primary,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FluentIcons.timer_10_20_regular,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '30 mins Cooking time',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              FluentIcons.food_20_regular,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '1 serving',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 35,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          side: const BorderSide(color: Colors.grey)),
                      child: const Text(
                        'Beverage',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
