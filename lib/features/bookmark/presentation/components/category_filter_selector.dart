import 'package:easy_cook/common/widgets/custom_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CategoryFilterSelector extends StatefulWidget {
  const CategoryFilterSelector({Key? key}) : super(key: key);

  @override
  State<CategoryFilterSelector> createState() => _CategoryFilterSelectorState();
}

class _CategoryFilterSelectorState extends State<CategoryFilterSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter Categories',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: List.generate(
              10,
              (index) => Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: ChoiceChip(
                        color:
                            const MaterialStatePropertyAll(Colors.transparent),
                        backgroundColor: Colors.transparent,
                        shape: const StadiumBorder(),
                        onSelected: (val) {},
                        selectedColor: Theme.of(context).colorScheme.primary,
                        side: const BorderSide(width: 0.5, color: Colors.grey),
                        label: const Text('Pasta'),
                        selected: false),
                  )),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Apply filter'),
            SizedBox(width: 10,),
            Icon(FluentIcons.options_20_regular)
          ],
        ), onPressed: () {}),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
