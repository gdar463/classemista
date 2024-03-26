//
// display.dart
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

import 'package:flutter/material.dart' as flutter;

class Display {
  /// A wrapper for showDialog, with only adding a OK button
  static void showDialog(
    String title,
    String body,
    flutter.BuildContext context,
  ) {
    flutter.showDialog<void>(
      context: context,
      builder: (context) => flutter.AlertDialog(
        title: flutter.Text(title),
        content: flutter.Text(body),
        actions: [
          flutter.TextButton(
            child: const flutter.Text("OK"),
            onPressed: () => flutter.Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
