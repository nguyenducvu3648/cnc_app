import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class TableCalendar extends StatefulWidget {
  @override
  _TableCalendarState createState() => _TableCalendarState();
}

class _TableCalendarState extends State<TableCalendar> {
  DateTime selectedDay = DateTime.now();
  List<CleanCalendarEvent> selectedEvent = [];
  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent(
        'Product',
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
        description: '399',
        color: Colors.blue,
      ),
      CleanCalendarEvent(
        'time',
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
        description: '9',
        color: Colors.blue,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2): [
      CleanCalendarEvent(
        'Event B',
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 12, 0),
        color: Colors.orange,
      ),
      CleanCalendarEvent(
        'Event C',
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2, 17, 0),
        color: Colors.pink,
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: renderCalendar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderCalendar() {
    return Calendar(
      startOnMonday: true,
      selectedColor: Colors.blue,
      todayColor: Colors.red,
      eventColor: Colors.green,
      eventDoneColor: Colors.amber,
      bottomBarColor: Colors.deepOrange,
      onRangeSelected: (range) {
        print('selected Day ${range.from},${range.to}');
      },
      onDateSelected: _handleData,
      events: events,
      isExpanded: true,
      dayOfWeekStyle: TextStyle(
        fontSize: 15,
        color: Colors.black12,
        fontWeight: FontWeight.w100,
      ),
      bottomBarTextStyle: TextStyle(
        color: Colors.white,
      ),
      hideBottomBar: false,
      hideArrows: false,
      weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    );
  }

  void _handleData(DateTime date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }
}