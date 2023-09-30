import 'package:easy_cook/common/notifiers/user_cache_notifier.dart';
import 'package:easy_cook/core/constants/storage_keys.dart';
import 'package:easy_cook/core/helpers/storage_helper.dart';
import 'package:easy_cook/features/auth/data/models/auth_state.dart';
import 'package:easy_cook/features/auth/dormain/models/login_payload.dart';
import 'package:easy_cook/features/auth/dormain/models/signup_payload.dart';
import 'package:easy_cook/features/auth/dormain/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final UserCacheNotifier userCacheNotifier;

  AuthNotifier({required this.authRepository, required this.userCacheNotifier})
      : super(const AuthState.unknown());

  Future<void> registerUser({required SignupPayload signupPayload}) async {
    state = state.copiedWithIsLoading(AuthStatus.loading);

    var response =
        await authRepository.registerUser(signupPayload: signupPayload);

    response.fold(
        (left) => state = AuthState(
            authStatus: AuthStatus.unauthenticated,
            user: null,
            error: left.message), (right) {
      state = AuthState(
          authStatus: AuthStatus.authenticated,
          user: right.firebaseUser,
          error: null);
      userCacheNotifier.cacheUser(right.appUser);
      StorageHelper.setBoolean(StorageKeys.stayLoggedIn, true);
    });
  }

  Future<void> loginUser({required LoginPayLoad loginPayload}) async {
    state = state.copiedWithIsLoading(AuthStatus.loading);

    var response = await authRepository.loginUser(loginPayload: loginPayload);

    response.fold(
        (left) => state = AuthState(
            authStatus: AuthStatus.unauthenticated,
            user: null,
            error: left.message), (right) {
      state = AuthState(
          authStatus: AuthStatus.authenticated,
          user: right.firebaseUser,
          error: null);
      userCacheNotifier.cacheUser(right.appUser);
      StorageHelper.setBoolean(StorageKeys.stayLoggedIn, true);
    });
  }
}
