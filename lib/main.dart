import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:break_time/view/screen/edit_screen.dart';
import 'package:break_time/model/calendar_model.dart';

import 'view/screen/home_screen.dart';

late Box boxes;
late Box calendarType;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CalendarModelAdapter());
  boxes = await Hive.openBox<CalendarModel>('calendarmodelbox');
  calendarType = await Hive.openBox('calendarType');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CalendarModel? calendarmodel;
    int firstScreen = 0;
    try {
      calendarmodel = boxes.get('CalendarModel');
      firstScreen = calendarmodel!.firstScreen;
    } catch (e) {}
    return MaterialApp(
      title: 'Break Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[200]!),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) =>
            firstScreen == 1 ? const HomeScreen() : const EditScreen()
      },
    );
  }
}
