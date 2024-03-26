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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("First Name: ${widget.profile.firstName}"),
        Text("Last Name: ${widget.profile.lastName}"),
        Text("Ident: ${widget.profile.ident}"),
        Text("API Ident: ${widget.profile.ident.substring(1)}"),
        FilledButton(
          onPressed: () {
            setState(() {
              pressed = !pressed;
            });
          },
          child: const Text("Show API Token"),
        ),
        Builder(
          builder: (BuildContext context) {
            if (pressed) {
              return Text("API Token: ${widget.profile.token}");
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
