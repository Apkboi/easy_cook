import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';


@freezed
class AppUser with _$AppUser {
  const factory AppUser(
      {required String about,
      String? avatar,
      required String uid,
      required String email,
      // 10 September 2023 at 12:10:49 UTC+1
      required DateTime joinedDate,
      required List<dynamic> cuisines,
      String? coverImage,
      required String fullName,
      String? gender}) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromNewUser(
          {required String uid,
          required String usersFullname,
          required String email}) =>
      AppUser(
          about: 'I am $usersFullname, a new user on Easy Cook',
          joinedDate: DateTime.now(),
          cuisines: [],
          fullName: usersFullname,
          uid: uid,
          email: email);
}
