import 'dart:collection';

class SignupPayload extends MapView {
  final String fullname;
  final String email;
  final String password;

  SignupPayload(
      {required this.fullname, required this.email, required this.password})
      : super({
          "email": email,
          "fullname": fullname,
          "passsword": email,
        });

// Map withoutPassword() => {"email": email, "fullname": fullname};
}
