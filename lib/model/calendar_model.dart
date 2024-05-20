import 'package:hive/hive.dart';

part 'calendar_model.g.dart';

@HiveType(typeId: 1)
class CalendarModel extends HiveObject {
  @HiveField(0)
  final int workValue;
  @HiveField(1)
  final int holidayValue;
  @HiveField(2)
  final int firstScreen;
  CalendarModel(
      {required this.workValue,
      required this.holidayValue,
      required this.firstScreen});
}
