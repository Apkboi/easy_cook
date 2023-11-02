import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseStateNotifier<T> extends StateNotifier<T> {
  BaseStateNotifier(T state) : super(state);

  final NavigationEmitter navigator = NavigationEmitter();
  final Set<dynamic> _disposables = {};
  Timer? _debouncer;

  void debounce(Duration duration, void Function() action) {
    _debouncer?.cancel();
    _debouncer = Timer(duration, action);
  }

  bool disposed = false;

  void addDisposables(dynamic subscription) {
    _disposables.add(subscription);
  }

  @override
  void dispose() {
    for (final element in _disposables) {
      if (element is StreamSubscription) element.cancel();
      if (element is void Function()) {
        element.call();
      }
    }
    navigator.dispose();
    _debouncer?.cancel();
    disposed = true;
    super.dispose();
  }
}

class NavigationEmitter {
  final _subject = StreamController<NavigationEvent<dynamic>>.broadcast();

  Stream<NavigationEvent<dynamic>> get navigationStream => _subject.stream;

  void dispatch<T>(NavigationEvent<T> event) {
    if (!event.isContentHandled && !_subject.isClosed) {
      _subject.sink.add(event);
    }
  }

  void dispose() {
    _subject.close();
  }
}

abstract class NavigationEvent<T> {
  NavigationEvent();

  bool _contentHandled = false;

  bool get isContentHandled {
    return _contentHandled;
  }

  Future navigate(BuildContext context) async {
    _contentHandled = true;
    return this as T;
  }
}

class DataBindingBuilder<T, R> {
  final Widget Function(BuildContext, R, T) builder;

  DataBindingBuilder(this.builder);
}

// Widget that acts as a "ViewModelProvider"
class CustomStateConsumerWidget<T extends BaseStateNotifier>
    extends ConsumerWidget {
  final Widget Function(BuildContext, T)? builder;
  final Widget child;
  final StateNotifierProvider<T, Object?> provider;

  const CustomStateConsumerWidget({
    required this.provider,
    super.key,
    this.builder,
    required this.child,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Consumer(
      builder: (context, ref, child) {
        return _builder(context, ref, child);
      },
      child: child,
    );
  }

  Widget _builder(BuildContext context, WidgetRef ref, Widget? child) {
    final viewModel = ref.read<T>(provider.notifier);
    final subscription =
    viewModel.navigator.navigationStream.listen((event) async {
      if (!event.isContentHandled && context.mounted) {
        await event.navigate(context);
      }
    });
    viewModel.addDisposables(subscription);
    return (null != builder)
        ? builder!.call(context, viewModel)
        : child ?? const SizedBox.shrink();
  }
}

// void main() {
//   runApp(
//     ProviderScope(
//       child: ViewModelProvider(
//         builder: (context, viewModel) {
//           // Return the widget tree that uses the view model
//           // You can access the view model using the 'viewModel' parameter
//           return MaterialApp(
//             home: Scaffold(
//               appBar: AppBar(
//                 title: Text('Riverpod ViewModel Example'),
//               ),
//               body: Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Example of using a view model method
//                     viewModel.navigate(context);
//                   },
//                   child: Text('Navigate to New Screen'),
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Container(), // Replace with your app's root widget
//       ),
//     ),
//   );
// }
