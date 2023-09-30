import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_cook/common/models/app_error.dart';
import 'package:easy_cook/core/constants/firebase/firebase_collections.dart';
import 'package:easy_cook/core/constants/firebase/firebase_fields.dart';
import 'package:easy_cook/features/auth/data/models/app_user.dart';
import 'package:easy_cook/features/auth/dormain/models/login_payload.dart';
import 'package:easy_cook/features/auth/dormain/models/signup_payload.dart';
import 'package:easy_cook/features/auth/dormain/repositories/auth_repository.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<AppError, ({AppUser appUser, User firebaseUser})>> loginUser(
      {required LoginPayLoad loginPayload}) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
          email: loginPayload.email, password: loginPayload.password);

      User? user = userCredential.user;
      CollectionReference usersCollection =
          _fireStore.collection(FirebaseCollections.users);

      if (user != null) {
        var alreadyExistingUser = await usersCollection
            .where(FirebaseFields.uid, isEqualTo: user.uid)
            .limit(1)
            .get();

        if (alreadyExistingUser.docs.isEmpty) {
          return const Left(
              AppError(message: "User record  doesn't exists", code: 400));
        } else {
          AppUser loggedInUser = AppUser.fromJson(
              (alreadyExistingUser.docs.first.data() as Map<String, dynamic>));

          return Right((appUser: loggedInUser, firebaseUser: user));
        }
      } else {
        return const Left(AppError(message: "Sign up Failed", code: 400));
      }
    } on Exception catch (e) {
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, ({AppUser appUser, User firebaseUser})>> registerUser(
      {required SignupPayload signupPayload}) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: signupPayload.email, password: signupPayload.password);

      User? user = userCredential.user;
      CollectionReference usersCollection =
          _fireStore.collection(FirebaseCollections.users);

      if (user != null) {
        var alreadyExistingUser = await usersCollection
            .where(FirebaseFields.uid, isEqualTo: user.uid)
            .limit(1)
            .get();

        if (alreadyExistingUser.docs.isEmpty) {
          final newUser = AppUser.fromNewUser(
              uid: user.uid,
              usersFullname: signupPayload.fullname,
              email: signupPayload.email);

          await usersCollection.doc(user.uid).set(newUser.toJson());

          return Right((appUser: newUser, firebaseUser: user));
        } else {
          return const Left(
              AppError(message: "User already exists", code: 400));
        }
      } else {
        return const Left(AppError(message: "Sign up Failed", code: 400));
      }
    } on Exception catch (e) {
      return Left(AppError.fromException(e));
    }
  }
}
