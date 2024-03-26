//
// lessons_response_model.dart
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

/// A class holding the list of Lesson for a day
class LessonsResponseModel {
  final List<Lesson> lessons;

  /// Constructor requiring the list of lessons
  LessonsResponseModel({
    required this.lessons,
  });

  /// Creates a LessonsResponse from a json (formatted as Map<String, dynamic>)
  factory LessonsResponseModel.fromJson(Map<String, dynamic> json) {
    List<Lesson> lessons = [];
    for (final lesson in json["lessons"]) {
      lessons.add(Lesson(
        hour: lesson["evtHPos"],
        duration: lesson["evtDuration"],
        author: lesson["authorName"],
        subject: lesson["subjectDesc"],
        lessonType: lesson["lessonType"],
        lessonDescription: lesson["lessonArg"],
      ));
    }
    return LessonsResponseModel(lessons: lessons);
  }
}

/// A class holding a Classeviva lesson
class Lesson {
  final int hour;
  final int duration;

  final String author;
  final String subject;
  final String lessonType;
  final String lessonDescription;

  /// Constructor requiring all of the values
  Lesson({
    required this.hour,
    required this.duration,
    required this.author,
    required this.subject,
    required this.lessonType,
    required this.lessonDescription,
  });
}
