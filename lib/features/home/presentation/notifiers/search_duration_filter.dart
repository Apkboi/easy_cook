import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchDurationFilter extends StateNotifier<RangeValues> {
  SearchDurationFilter() : super(const RangeValues(2, 6));

  void updateDuration(RangeValues values) {
    state = values;
  }
}
