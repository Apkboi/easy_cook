import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountdownState {
  int duration;
  final String? timingFor;
  final bool isRunning;

  CountdownState(
      {required this.duration,
      required this.isRunning,
      required this.timingFor});
}

class CountdownNotifier extends StateNotifier<CountdownState> {
  CountdownNotifier()
      : super(CountdownState(duration: 0, isRunning: false, timingFor: null));

  Timer? _timer;

  bool start({required int duration, required String timingFor}) {

    if (state.duration > 0 && !state.isRunning && (timingFor == state.timingFor || state.timingFor == null)) {

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        state = CountdownState(
            duration: state.duration - 1,
            isRunning: true,
            timingFor: timingFor);
        if (state.duration <= 0) {
          timer.cancel();
          state = CountdownState(
              duration: 0, isRunning: false, timingFor: timingFor);
        }
      });
      return true;


    } else if (state.duration <= 0 && !state.isRunning) {
      state.duration = duration * 60;
     return start(duration: duration, timingFor: timingFor);
    }else{
      return false;
    }
  }

  void pause() {
    if (state.isRunning) {
      _timer?.cancel();
      state = CountdownState(
          duration: state.duration,
          isRunning: false,
          timingFor: state.timingFor);
    }
  }

  void reset() {
    _timer?.cancel();
    state = CountdownState(duration: 0, isRunning: false, timingFor: null);
  }

  @override
  void dispose() {
    if (mounted) {
      _timer?.cancel();
    }
    super.dispose();
  }
}
