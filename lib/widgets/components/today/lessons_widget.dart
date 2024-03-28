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
          List<Lesson> lessons = snapshot.data!.lessons;
          if (lessons.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      "Lezioni",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                ...lessons.map((value) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                      left: 8,
                      right: 8,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: const Color(0xff282828),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0x00ffffff),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              value.subject,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5.25),
                            Row(
                              children: [
                                const Icon(Icons.person, size: 15),
                                const SizedBox(width: 5),
                                Text(
                                  value.author,
                                  style: const TextStyle(fontSize: 11.5),
                                ),
                                const SizedBox(width: 7.5),
                                const Icon(Icons.schedule, size: 15),
                                const SizedBox(width: 5),
                                Text(
                                  "${value.hour}° ora",
                                  style: const TextStyle(fontSize: 11.5),
                                )
                              ],
                            ),
                            Builder(
                              builder: (BuildContext context) {
                                if (value.lessonDescription.isNotEmpty) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 3.5),
                                      const Divider(),
                                      const SizedBox(height: 3.5),
                                      Text(
                                        value.lessonDescription,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  );
                                }
                                return const SizedBox();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 10),
              ],
            );
          }
          return const SizedBox();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
