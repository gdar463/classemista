//
// profile.dart
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

import 'package:classemista/cvv/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.profile,
  });

  final ProfileModel profile;

  @override
  State<ProfileWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileWidget> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF501515),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First Name: ${widget.profile.firstName}",
              style: style,
            ),
            Text("Last Name: ${widget.profile.lastName}", style: style),
            Text("Ident: ${widget.profile.ident}", style: style),
            Text("API Ident: ${widget.profile.ident.substring(1)}",
                style: style),
            FilledButton(
              onPressed: () {
                setState(() {
                  pressed = !pressed;
                });
              },
              child: Text("Show API Token", style: style),
            ),
            Builder(
              builder: (BuildContext context) {
                if (pressed) {
                  return Text(
                    "API Token: ${widget.profile.token}",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
