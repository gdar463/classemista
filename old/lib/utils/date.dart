//
// date.dart
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

class Date {
  /// Takes in a date (as a DateTime) and returns the same date (as a String formatted as YYYYMMDD)
  static String dateTimeToString(DateTime date) {
    return date.year.toString() +
        date.month.toString().padLeft(2, "0") +
        date.day.toString().padLeft(2, "0");
  }

  /// Takes in a month number (as a int) and returns the same month abbreviated (as a String)
  static String monthToAbrvString(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
    }
    return "Jan";
  }

  /// Takes in a month number (as a int) and returns the same month (as a String)
  static String monthToString(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "Febraury";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
    }
    return "January";
  }
}
