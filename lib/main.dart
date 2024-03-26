//
// main.dart
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

import "package:classemista/cvv/features/auth.dart";
import "package:classemista/cvv/models/profile_model.dart";
import "package:classemista/widgets/main_page.dart";
import "package:flutter/material.dart";
import "package:classemista/widgets/login.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

/// Entrypoint
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget start = const LoginPage();

  const FlutterSecureStorage storage = FlutterSecureStorage();
  if (await storage.containsKey(key: "uid") &&
      await storage.containsKey(key: "pass")) {
    try {
      start = MainPage(
        profile: ProfileModel.fromAuth(
          await login(
              await storage.read(key: "uid"), await storage.read(key: "pass")),
        ),
      );
    } catch (e) {
      //ignored
    }
  }

  runApp(ClassemistaApp(start: start));
}

/// Flutter Entrypoint
class ClassemistaApp extends StatelessWidget {
  const ClassemistaApp({super.key, required this.start});

  final Widget start;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Magico MOndo DI ZMAPPA",
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: "Poppins",
        colorSchemeSeed: const Color(0xFF501515),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",
        colorSchemeSeed: const Color(0xFF502524),
      ),
      home: start,
      debugShowCheckedModeBanner: false,
    );
  }
}
