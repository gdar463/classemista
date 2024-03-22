import "package:classemista/cvv/models/auth_response_model.dart";

class Profile {
  final String? token;

  final String? firstName;
  final String? lastName;
  final String? ident;

  Profile(
      {required this.token,
      required this.firstName,
      required this.lastName,
      required this.ident});

  Profile copyWith({
    String? token,
    String? firstName,
    String? lastName,
    String? ident,
  }) {
    return Profile(
      token: token ?? this.token,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      ident: ident ?? this.ident,
    );
  }

  static Profile fromAuth(AuthResponseModel auth) {
    return Profile(
        token: auth.token,
        firstName: auth.firstName,
        lastName: auth.lastName,
        ident: auth.ident);
  }
}
