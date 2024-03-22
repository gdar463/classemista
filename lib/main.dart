import "package:flutter/material.dart";
import "widgets/login.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Magico MOndo DI ZMAPPA",
      themeMode: ThemeMode.system,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
