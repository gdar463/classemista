//
// auth_response_model.dart
//
// Copyright (C) 2024 gdar463 <gdar463@gmail.com>
//
// This program is free software: you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation, version 3.
//
// This program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General
// Public License along with this program. If not, see
// <https://www.gnu.org/licenses/>.
//

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
