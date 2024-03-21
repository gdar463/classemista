import "dart:convert";

import "package:http/http.dart" as http;
import "package:my_classeviva/cvv/base.dart";
import "package:my_classeviva/cvv/exceptions/http_request_exception.dart";
import "package:my_classeviva/cvv/exceptions/wrong_credentials_exception.dart";
import "package:my_classeviva/cvv/models/auth_response_model.dart";

Future<AuthResponseModel> login(String? username, String? password) async {
  const String url = Base.baseUrl + Endpoints.loginPoint;

  var response = await http.post(Uri.parse(url),
      body: utf8.encode(jsonEncode({"uid": username, "pass": password})),
      headers: {
        "User-Agent": Base.userAgent,
        Base.devKey: Base.devKeyValue,
        "Content-Type": "application/json"
      });

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
