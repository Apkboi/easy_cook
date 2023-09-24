import 'package:easy_cook/common/models/app_error.dart';

import 'package:easy_cook/features/auth/dormain/repositories/auth_repository.dart';
import 'package:easy_cook/features/auth/dormain/typedefs/user_id.dart';
import 'package:either_dart/src/either.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<AppError, UserId>> loginUser() {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, UserId>> registerUser() {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
