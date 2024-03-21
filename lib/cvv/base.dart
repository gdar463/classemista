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
