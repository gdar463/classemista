//
// date_selector.dart
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

import "package:classemista/utils/date.dart";
import "package:flutter/material.dart";

/// A type definition needed to define the parameters of the widget
typedef DateCallback = void Function(DateTime selectedDate);

/// The widget for the DateSelector on TodayPage
class DateSelector extends StatefulWidget {
  const DateSelector(
      {super.key, required this.startDate, required this.callback});

  final DateTime startDate;
  final DateCallback callback;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

/// The state for the DateSelector on TodayPage
class _DateSelectorState extends State<DateSelector> {
  List<DateTime> dates = [
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now()
  ];

  @override
  void initState() {
    super.initState();
    setup();
  }

  /// A function executed on a change of state in the DateSelector
  void setup() {
    for (var i = 0; i < 7; i++) {
      dates[i] = widget.startDate.subtract(Duration(days: -i + 3));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFF501515),
        border: Border(
          bottom: BorderSide(
            width: 8,
            style: BorderStyle.solid,
            color: Color(0xFF501515),
          ),
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(20, 16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...dates.map(
            (e) => InkWell(
              onTap: () {
                widget.callback(e);
              },
              child: Column(
                children: [
                  Text(
                    e.day.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    Date.monthToString(e.month),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
