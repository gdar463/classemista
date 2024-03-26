//
// today.dart
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

import "package:classemista/cvv/models/profile_model.dart";
import "package:classemista/widgets/components/today/date_selector.dart";
import "package:classemista/widgets/components/today/today_contents.dart";
import "package:flutter/material.dart";

class TodayPage extends StatefulWidget {
  const TodayPage({super.key, required this.profile});

  final ProfileModel profile;

  @override
  State<StatefulWidget> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  DateTime selectedDate = DateTime.utc(2024, DateTime.april, 22);

  void dateCallback(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateSelector(
          startDate: DateTime.utc(2024, DateTime.april, 22),
          callback: dateCallback,
        ),
        Expanded(
          child: TodayContents(
            profile: widget.profile,
            selectedDate: selectedDate,
          ),
        ),
      ],
    );
  }

  void _showDialog(String title, String body) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
