//
// lessons.dart
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

import "package:classemista/cvv/base.dart";
import "package:classemista/cvv/exceptions/http_request_exception.dart";
import "package:classemista/cvv/exceptions/unathorized_exception.dart";
import "package:classemista/cvv/models/lessons_response_model.dart";
import "package:classemista/cvv/models/profile_model.dart";
import "package:classemista/utils/url.dart";
import "package:http/http.dart" as http;

/// Get the lessons for a certain date (format: YYYYMMDD)
Future<LessonsResponseModel> getLessons(
    ProfileModel profile, String date) async {
  String url = Url.formatUrl(
    Base.baseUrl + Endpoints.lessonsPoint,
    Map.fromIterables(
      {
        "{ident}",
        "{day}",
      },
      {
        profile.ident.substring(1),
        date,
      },
    ),
  );

  http.Response response = await http.get(
    Uri.parse(url),
    headers: {
      "User-Agent": Base.userAgent,
      Base.devKey: Base.devKeyValue,
      "Content-Type": "application/json",
      Base.tokenKey: profile.token
    },
  );

  switch (response.statusCode) {
    case 200:
      break;
    case 401:
      throw UnathorizedException();
    default:
      throw HttpRequestException(url: url, statusCode: response.statusCode);
  }

  return LessonsResponseModel.fromJson(
    jsonDecode(response.body) as Map<String, dynamic>,
  );
}
