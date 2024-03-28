//
// today_contents.dart
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
import "package:classemista/widgets/components/today/lessons_widget.dart";
import "package:flutter/material.dart";

/// The widget for the contents of TodayPage
class TodayContents extends StatefulWidget {
  const TodayContents({
    super.key,
    required this.profile,
    required this.selectedDate,
  });

  final ProfileModel profile;
  final DateTime selectedDate;

  @override
  State<TodayContents> createState() => _TodayContentsState();
}

/// The state for the contents of TodayPage
class _TodayContentsState extends State<TodayContents> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          LessonsWidget(
            profile: widget.profile,
            selectedDate: widget.selectedDate,
          ),
        ],
      ),
    );
  }
}
