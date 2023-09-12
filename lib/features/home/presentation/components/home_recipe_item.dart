import 'package:easy_cook/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class HomeRecipeItem extends StatefulWidget {
  const HomeRecipeItem({Key? key}) : super(key: key);

  @override
  State<HomeRecipeItem> createState() => _HomeRecipeItemState();
}

class _HomeRecipeItemState extends State<HomeRecipeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,

      shadowColor: Colors.grey,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 75,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage(AppImages.pizza2), fit: BoxFit.cover)),
              ),
              const SizedBox(width: 10,),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Healthy Vegan Salad and Pasta\nwith Stew.',
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      '40 Mins | 1 Serving',
                      style: Theme.of(context)
                          .textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.w600,color: Colors.grey),
                    ),
                  ),

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
