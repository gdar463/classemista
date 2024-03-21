class AuthResponseModel {
  final String token;

  final String firstName;
  final String lastName;
  final String ident;

  AuthResponseModel(
      {required this.token,
      required this.firstName,
      required this.lastName,
      required this.ident});

  AuthResponseModel copyWith(
      {String? token, String? firstName, String? lastName, String? ident}) {
    return AuthResponseModel(
        token: token ?? this.token,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        ident: ident ?? this.ident);
  }

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "token": String token,
        "ident": String ident,
        "firstName": String firstName,
        "lastName": String lastName
      } =>
        AuthResponseModel(
            token: token,
            firstName: firstName,
            lastName: lastName,
            ident: ident),
      _ => throw const FormatException("Failed to load Auth Response"),
    };
  }
}
