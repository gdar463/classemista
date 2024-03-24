//
// http_request_exception.dart
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

class HttpRequestException implements Exception {
  final String? url;
  final int? statusCode;

  HttpRequestException({required this.url, required this.statusCode});

  @override
  String toString() {
    return "HTTP Request Exception: The url \"$url\" returned code $statusCode";
  }
}
