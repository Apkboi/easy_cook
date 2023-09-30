import 'dart:async';
import 'dart:developer';

import 'package:easy_cook/core/constants/storage_keys.dart';
import 'package:easy_cook/core/helpers/storage_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IsLoggedInNotifier extends StateNotifier<bool> {
  IsLoggedInNotifier() : super(false) {
    _listenToAuthChanges();
  }

  bool _isLoggedIn = false;
  StreamSubscription? sub;

  void _listenToAuthChanges() {
    sub = FirebaseAuth.instance.authStateChanges().listen((event) async {
      log('AUTHSTATE CHANGED');
      var isLoggedIn =
          await StorageHelper.getBoolean(StorageKeys.stayLoggedIn, false);

      _isLoggedIn = isLoggedIn && (event != null);

      state = _isLoggedIn;

      log('ISAUNTENTICATED : $_isLoggedIn');
    });
  }

  Future<void> refreshAuthState() async {
    var isLoggedIn =
        await StorageHelper.getBoolean(StorageKeys.stayLoggedIn, false);
    User? loggedInUser = FirebaseAuth.instance.currentUser;

    state = (loggedInUser != null) && isLoggedIn;
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }
}
