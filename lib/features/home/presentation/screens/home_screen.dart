import 'package:auto_route/annotations.dart';
import 'package:easy_cook/features/home/presentation/components/recipe_category_switcher.dart';
import 'package:easy_cook/features/home/presentation/components/recipes_by_categories.dart';
import 'package:easy_cook/features/home/presentation/components/trending_recipe_widget.dart';
import 'package:easy_cook/features/home/presentation/components/new_recipes_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  NestedScrollView(
        body:
          const RecipesByCategories()
        , headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {

          return [
             const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    _TittleBar(),
                    SizedBox(height: 25,),
                    // CustomSearchBar(tittle: 'Search Recipes',),
                    // SizedBox(height: 25,),
                    NewRecipeWidget(),
                    SizedBox(height: 25,),
                    TrendingRecipeWidget(),
                    SizedBox(
                      height: 16,
                    ),
                    RecipeCategorySwitcher(),
                    SizedBox(
                      height: 10,
                    ),




                  ],
                ),
              ),
            ),

          ];
      },

      ),
    );
  }
}

class _TittleBar extends StatelessWidget {
  const _TittleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Victor,',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'What you want to cook today ?',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
          ],
        )),
        const Text('👳‍',style: TextStyle(fontSize: 40),)
      ],
    );
  }
}
