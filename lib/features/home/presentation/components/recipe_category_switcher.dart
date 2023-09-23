import 'package:easy_cook/common/models/categories.dart';
import 'package:easy_cook/common/provider/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final FutureProvider<bool> tetProv = FutureProvider((ref) => false);

class RecipeCategorySwitcher extends ConsumerStatefulWidget {
  const RecipeCategorySwitcher({
    Key? key,
    required this.switcherProvider,
    this.hasAll = true,
  }) : super(key: key);

  final StateProvider<RecipeCategory?> switcherProvider;
  final bool hasAll;

  @override
  ConsumerState<RecipeCategorySwitcher> createState() =>
      _RecipeCategorySwitcherState();
}

class _RecipeCategorySwitcherState
    extends ConsumerState<RecipeCategorySwitcher> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);

    // categories.map<Widget>(data: data, error: error, loading: loading)
    return categories.when(
      data: (data) {
        if (widget.hasAll) {
          data = [RecipeCategory.all(), ...data];
        }

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
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.grey),
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
                itemCount: data.toList().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      ref.read(widget.switcherProvider.notifier).state =
                          data.toList()[index];
                    },
                    child: SwitcherButton(
                      isSelected: ref.watch(widget.switcherProvider)?.id ==
                          data.toList()[index].id,
                      category: data.toList()[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}

class SwitcherButton extends StatefulWidget {
  const SwitcherButton(
      {Key? key, required this.isSelected, required this.category})
      : super(key: key);
  final bool isSelected;
  final RecipeCategory category;

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
          widget.category.name,
          style: TextStyle(
              color: widget.isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

// void ff() async {
//   var b = ref.watch(tetProv.future);
// }
}
