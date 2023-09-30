import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String? error;

  const AuthState({
    required this.authStatus,
    required this.user,
    required this.error,
  });

  const AuthState.unknown()
      : authStatus = AuthStatus.unauthenticated,
        error = null,
        user = null;

  AuthState copiedWithIsLoading(AuthStatus isLoading) => AuthState(
        authStatus: isLoading,
        user: user,
        error: error,
      );

  AuthState copyWith(
          {AuthStatus? newAuthState, User? newUser, String? newError}) =>
      AuthState(
        authStatus: newAuthState ?? authStatus,
        user: newUser ?? user,
        error: newError ?? error,
      );

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (error == other.error &&
          authStatus == other.authStatus &&
          user == other.user);

  @override
  int get hashCode => Object.hash(
        error,
        authStatus,
        user,
      );
}

enum AuthStatus { loading, authenticated, unauthenticated }
