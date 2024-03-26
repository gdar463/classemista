//
// profile.dart
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

import "package:classemista/cvv/models/auth_response_model.dart";

class ProfileModel {
  final String token;

  final String firstName;
  final String lastName;
  final String ident;

  ProfileModel({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.ident,
  });

  ProfileModel copyWith({
    String? token,
    String? firstName,
    String? lastName,
    String? ident,
  }) {
    return ProfileModel(
      token: token ?? this.token,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      ident: ident ?? this.ident,
    );
  }

  factory ProfileModel.fromAuth(AuthResponseModel auth) {
    return ProfileModel(
      token: auth.token,
      firstName: auth.firstName,
      lastName: auth.lastName,
      ident: auth.ident,
    );
  }

  factory ProfileModel.empty() {
    return ProfileModel(
      token: "",
      firstName: "",
      lastName: "",
      ident: "",
    );
  }
}