import 'package:easy_cook/features/home/presentation/components/trending_recipe_item.dart';
import 'package:flutter/material.dart';

class TrendingRecipeWidget extends StatefulWidget {
  const TrendingRecipeWidget({Key? key}) : super(key: key);

  @override
  State<TrendingRecipeWidget> createState() => _TrendingRecipeWidgetState();
}

class _TrendingRecipeWidgetState extends State<TrendingRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Recipe',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>  Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TrendingRecipeItem(index: index,),
            ),
          ),
        )
      ],
    );
  }
}
