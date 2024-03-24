//
// main_page.dart
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

import 'package:classemista/widgets/journal.dart';
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
