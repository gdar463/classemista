//
// base.dart
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

class Base {
  // Base API URL
  static const String baseUrl = "https://web.spaggiari.eu/rest/v1";

  // Required User-Agent (if not used, every request returns 400)
  static const String userAgent = "CVVS/std/4.2.3";

  // Required DevKey Header
  static const String devKey = "Z-Dev-Apikey";
  static const String devKeyValue = "Tg1NWEwNGIgIC0K";

  // User token Header
  static const String tokenKey = "Z-Auth-Token";
}

class Endpoints {
  static const String loginPoint = "/auth/login";
}
