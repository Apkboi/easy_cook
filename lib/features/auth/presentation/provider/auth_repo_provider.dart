import 'package:easy_cook/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:easy_cook/features/auth/dormain/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepoProvider = StateProvider<AuthRepository>((ref) => AuthRepositoryImpl());
