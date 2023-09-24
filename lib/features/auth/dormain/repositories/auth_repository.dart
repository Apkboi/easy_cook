import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/features/auth/dormain/typedefs/user_id.dart';
import 'package:either_dart/either.dart';

abstract class AuthRepository {
  Future<Either<AppError, UserId>> registerUser();

  Future<Either<AppError, UserId>> loginUser();
}
