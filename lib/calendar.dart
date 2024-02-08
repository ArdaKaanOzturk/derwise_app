import 'package:derwise_app/theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
        title: Text("My Education Dates"),
        backgroundColor: DerwiseTheme.backgroundApp,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // arrow back
          color: Colors.white,
          onPressed: () {},
        ),
      ),
      body: Container(
        child: TableCalendar(
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
      ),
    );
  }
}
