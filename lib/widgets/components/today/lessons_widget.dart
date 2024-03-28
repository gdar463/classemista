//
// lessons_widget.dart
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

import "package:classemista/cvv/features/lessons.dart";
import "package:classemista/cvv/models/lessons_response_model.dart";
import "package:classemista/cvv/models/profile_model.dart";
import "package:classemista/utils/date.dart";
import "package:flutter/material.dart";

class LessonsWidget extends StatefulWidget {
  const LessonsWidget({
    super.key,
    required this.profile,
    required this.selectedDate,
  });

  final ProfileModel profile;
  final DateTime selectedDate;

  @override
  State<LessonsWidget> createState() => _LessonsWidgetState();
}

class _LessonsWidgetState extends State<LessonsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LessonsResponseModel>(
      future: getLessons(
        widget.profile,
        Date.dateTimeToString(widget.selectedDate),
      ),
      builder: (
        BuildContext context,
        AsyncSnapshot<LessonsResponseModel> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return Column(
            children: [
              ...snapshot.data!.lessons.map((e) {
                return Text(e.lessonDescription);
              }),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
