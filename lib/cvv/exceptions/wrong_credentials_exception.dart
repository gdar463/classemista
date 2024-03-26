//
// wrong_credentials_exception.dart
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

/// An Exception indicating that the credentials entered are wrong
class WrongCredentialsExcpetion implements Exception {
  final String? uid;
  final String? pass;

  WrongCredentialsExcpetion({required this.uid, required this.pass});

  @override
  String toString() {
    return "Wrong Credentials\nuid: $uid\npass: $pass";
  }
}
