import 'dart:developer';

import 'package:easy_cook/common/widgets/error_widget.dart';
import 'package:easy_cook/features/home/presentation/components/trending_recipe_item.dart';
import 'package:easy_cook/features/home/presentation/provider/all_recipes_providers.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrendingRecipeWidget extends ConsumerStatefulWidget {
  const TrendingRecipeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<TrendingRecipeWidget> createState() =>
      _TrendingRecipeWidgetState();
}

class _TrendingRecipeWidgetState extends ConsumerState<TrendingRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    final trendingRecipe = ref.watch(allRecipesProvider);
    return trendingRecipe.when(
      data: (data) {
        log(data.length.toString());

        if (data.isNotEmpty) {
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
                  itemCount: data.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TrendingRecipeItem(
                      index: index,
                      recipe: data.toList()[index],
                    ),
                  ),
                ),
              )
            ],
          );
        } else {
          return ListView(
            children: const [
              AppPromptWidget(
                title: "No trending recipes yet",
                canTryAgain: false,
                message: '',
              )
            ],
          );
        }
      },
      error: (error, stackTrace) {
        // log(stackTrace.toString());
        return Text(error.toString());
      },
      loading: () {
        return SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: const Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator())));
      },
    );
  }
}
