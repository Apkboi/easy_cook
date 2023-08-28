import 'dart:async';

import 'package:easy_cook/features/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() => runApp(const EasyCookApp()), (error, stack) {});
}
