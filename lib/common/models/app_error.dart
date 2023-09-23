import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError({
    required String message,
    String? details,
    required int code,
  }) = _AppError;

  factory AppError.generic({required String message, String? details}) =>
      AppError(message: message, code: -1, details: details);

  factory AppError.fromException(Exception exception) {
    // Convert different exception types to AppError
    if (exception is FirebaseException) {
      return AppError(
          message: exception.message ?? 'Unknown Firebase Error',
          code: 500,
          details: exception.code);
    } else {
      return AppError.generic(message: exception.toString());
    }
  }
}
