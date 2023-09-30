import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/features/auth/data/models/app_user.dart';
import 'package:easy_cook/features/auth/dormain/models/login_payload.dart';
import 'package:easy_cook/features/auth/dormain/models/signup_payload.dart';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<AppError, ({AppUser appUser, User firebaseUser})>> registerUser(
      {required SignupPayload signupPayload});

  Future<Either<AppError, ({AppUser appUser, User firebaseUser})>> loginUser(
      {required LoginPayLoad loginPayload});




}
