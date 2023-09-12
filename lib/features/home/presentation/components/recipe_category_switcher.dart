import 'package:flutter/material.dart';

class RecipeCategorySwitcher extends StatefulWidget {
  const RecipeCategorySwitcher({Key? key}) : super(key: key);

  @override
  State<RecipeCategorySwitcher> createState() => _RecipeCategorySwitcherState();
}

class _RecipeCategorySwitcherState extends State<RecipeCategorySwitcher> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Categories',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w600, color: Colors.grey),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SwitcherButton(isSelected: index == 0 || index == 2),
            ),
          ),
        ),
      ],
    );
  }
}

class SwitcherButton extends StatefulWidget {
  const SwitcherButton({Key? key, required this.isSelected}) : super(key: key);
  final bool isSelected;

  @override
  State<SwitcherButton> createState() => _SwitcherButtonState();
}

class _SwitcherButtonState extends State<SwitcherButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: widget.isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: widget.isSelected
              ? null
              : Border.all(
                  width: 0.7,
                  color: Theme.of(context).colorScheme.primary,
                )),
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Text(
          'Pasta',
          style: TextStyle(
              color: widget.isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
