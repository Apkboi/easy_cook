import 'dart:ui';

import 'package:easy_cook/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatefulWidget {
  const RecipeItem({Key? key}) : super(key: key);

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.noodles,
                ),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 25,
                child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.grey.withOpacity(0.4)),
                    onPressed: () {},
                    child: const Text('Pasta')),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                    // Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.5),
                    Colors.black,
                    Colors.black,
                  ])),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        Expanded(
                          child: Text(
                            'Spaghetti with shrimp sauce',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                          ),
                        ),
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       FluentIcons.bookmark_28_filled,
                        //       color:
                        //       Theme.of(context).colorScheme.primary,
                        //     ))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '30 Mins | 1 Serving',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        // height: 300,
      ),
    );
  }
}
