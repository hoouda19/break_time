import 'package:hijri/hijri_calendar.dart';

int daysInMonth =
    DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

HijriCalendar now = HijriCalendar.now();
int daysInMonthHijri = now.getDaysInMonth(now.hYear, now.hMonth);
