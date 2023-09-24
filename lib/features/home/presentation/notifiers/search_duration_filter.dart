import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchDurationFilter extends StateNotifier<RangeValues?> {
  SearchDurationFilter() : super(null);

  void updateDuration(RangeValues values) {
    state = values;
  }
}
