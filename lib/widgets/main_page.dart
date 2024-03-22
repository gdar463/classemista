import 'package:flutter/material.dart';
import 'package:classemista/cvv/models/profile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.profile});

  final Profile? profile;

  ImageProvider<Object> getThemeIcon(BuildContext context) {
    String theme = "light";
    if (Theme.of(context).brightness == Brightness.dark) {
      theme = "dark";
    }
    return AssetImage("assets/images/classemista-$theme.png");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Icon(Icons.account_circle),
                const SizedBox(width: 10),
                Image(
                  image: getThemeIcon(context),
                  width: MediaQuery.of(context).size.width / 100 * 27.5,
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            Center(child: Text("today")),
            Center(child: Text("book")),
            Center(child: Text("camera")),
            Center(child: Text("settings"))
          ]),
          bottomNavigationBar: const TabBar(tabs: [
            Tab(icon: Icon(Icons.today), text: "Today"),
            Tab(icon: Icon(Icons.book_rounded), text: "Journal"),
            Tab(icon: Icon(Icons.camera), text: "Camera"),
            Tab(icon: Icon(Icons.settings), text: "Settings")
          ]),
        ));
  }
}
