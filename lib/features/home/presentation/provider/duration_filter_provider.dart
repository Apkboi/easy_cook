import 'package:easy_cook/features/home/presentation/notifiers/search_duration_filter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchDurationFilterProvider = StateNotifierProvider<SearchDurationFilter,RangeValues?>((ref) => SearchDurationFilter());