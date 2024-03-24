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
      throw WrongCredentialsExcpetion(uid: username, pass: password);
    default:
      throw HttpRequestException(url: url, statusCode: response.statusCode);
  }

  return AuthResponseModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>);
}
