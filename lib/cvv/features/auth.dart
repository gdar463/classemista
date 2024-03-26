//
// auth.dart
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

import "dart:convert";

import "package:http/http.dart" as http;
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:classemista/cvv/base.dart";
import "package:classemista/cvv/exceptions/http_request_exception.dart";
import "package:classemista/cvv/exceptions/wrong_credentials_exception.dart";
import "package:classemista/cvv/models/auth_response_model.dart";

const String url = Base.baseUrl + Endpoints.loginPoint;
const Map<String, String> headers = {
  "User-Agent": Base.userAgent,
  Base.devKey: Base.devKeyValue,
  "Content-Type": "application/json"
};

Future<AuthResponseModel> login(String? username, String? password) async {
  var response = await http.post(Uri.parse(url),
      body: utf8.encode(jsonEncode({"uid": username, "pass": password})),
      headers: headers);

  switch (response.statusCode) {
    case 200:
      const FlutterSecureStorage storage = FlutterSecureStorage();
      await storage.write(key: "uid", value: username);
      await storage.write(key: "pass", value: password);
      break;
    case 422:
      throw WrongCredentialsExcpetion(uid: username, pass: password);
    default:
      throw HttpRequestException(url: url, statusCode: response.statusCode);
  }

  return AuthResponseModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>);
}

Future<AuthResponseModel> refresh() async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  String? username = await storage.read(key: "uid");
  String? password = await storage.read(key: "pass");

  var response = await http.post(Uri.parse(url),
      body: utf8.encode(jsonEncode({"uid": username, "pass": password})),
      headers: headers);

  switch (response.statusCode) {
    case 200:
      break;
    case 422:
      const FlutterSecureStorage storage = FlutterSecureStorage();
      await storage.delete(key: "uid");
      await storage.delete(key: "pass");
      throw WrongCredentialsExcpetion(uid: username, pass: password);
    default:
      const FlutterSecureStorage storage = FlutterSecureStorage();
      await storage.delete(key: "uid");
      await storage.delete(key: "pass");
      throw HttpRequestException(url: url, statusCode: response.statusCode);
  }

  return AuthResponseModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>);
}
