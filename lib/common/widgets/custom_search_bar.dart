import 'package:easy_cook/common/widgets/filled_textfield.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar(
      {Key? key,
      required this.tittle,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved})
      : super(key: key);
  final String tittle;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onFieldSubmitted;
  final String? Function(String?)? onSaved;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return FilledTextField(
      hint: widget.tittle,
      hasElevation: false,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      preffix: const Icon(FluentIcons.search_32_regular),
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      fillColor: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.1),
    );
  }
}
