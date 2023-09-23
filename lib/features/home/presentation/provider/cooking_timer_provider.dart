import 'package:easy_cook/features/home/presentation/notifiers/countdown_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cookingTimerProvider = StateNotifierProvider.autoDispose<CountdownNotifier, CountdownState>((ref) => CountdownNotifier());
