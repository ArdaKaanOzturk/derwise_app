import 'package:derwise_app/theme.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        title: const Text("My Session Dates"),
        backgroundColor: DerwiseTheme.backgroundApp,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // arrow back
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: 
      TableCalendar(
          locale: 'en_us',
          rowHeight: 35,
          headerStyle:
              HeaderStyle(formatButtonVisible: false, titleCentered: true),
          focusedDay: today,
          onDaySelected: _onDaySelected,
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
          firstDay: DateTime.utc(2000, 01, 01),
          lastDay: DateTime.utc(2030, 01, 01)),
    );
  }
}
