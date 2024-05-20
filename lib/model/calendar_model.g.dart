// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarModelAdapter extends TypeAdapter<CalendarModel> {
  @override
  final int typeId = 1;

  @override
  CalendarModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarModel(
      workValue: fields[0] as int,
      holidayValue: fields[1] as int,
      firstScreen: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.workValue)
      ..writeByte(1)
      ..write(obj.holidayValue)
      ..writeByte(2)
      ..write(obj.firstScreen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
