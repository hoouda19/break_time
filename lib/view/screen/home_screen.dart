import 'package:break_time/controller/calendar_controller.dart';
import 'package:break_time/main.dart';
import 'package:break_time/model/calendar_model.dart';
import 'package:break_time/view/screen/edit_screen.dart';
import 'package:break_time/view/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mainColor = Colors.lightBlue[100];
    var mediaQuery = MediaQuery.sizeOf(context);
    final CalendarModel calendarmodel = boxes.get('CalendarModel');
    final bool isHijriDate = calendarType.get('calendarType');

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Break Time'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(alignment: Alignment.center, children: [
                  isHijriDate
                      ? SfHijriDateRangePicker(
                          backgroundColor: mainColor,
                          view: HijriDatePickerView.month,
                          selectionMode: DateRangePickerSelectionMode.range,
                          selectionShape:
                              DateRangePickerSelectionShape.rectangle,
                          selectionColor: Colors.indigoAccent,
                          navigationMode: DateRangePickerNavigationMode.none,
                          initialSelectedRange: HijriDateRange(
                              HijriDateTime(HijriDateTime.now().year,
                                  HijriDateTime.now().month, 1),
                              HijriDateTime(HijriDateTime.now().year,
                                  HijriDateTime.now().month, daysInMonthHijri)),
                          allowViewNavigation: false,
                          selectableDayPredicate: (dateTime) {
                            int dayInCycle = (dateTime.day - 1) %
                                (calendarmodel.workValue +
                                    calendarmodel.holidayValue);
                            return dayInCycle < calendarmodel.workValue;
                          },
                          showNavigationArrow: false,
                          monthViewSettings:
                              const HijriDatePickerMonthViewSettings(
                                  dayFormat: 'EEE',
                                  enableSwipeSelection: false),
                          headerStyle: DateRangePickerHeaderStyle(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 25,
                                letterSpacing: 5,
                              ),
                              textAlign: TextAlign.center,
                              backgroundColor: Colors.lightBlue[100]),
                        )
                      : SfDateRangePicker(
                          selectableDayPredicate: (DateTime dateTime) {
                            int dayInCycle = (dateTime.day - 1) %
                                (calendarmodel.workValue +
                                    calendarmodel.holidayValue);
                            return dayInCycle < calendarmodel.workValue;
                          },
                          onSelectionChanged: null,
                          allowViewNavigation: false,
                          backgroundColor: mainColor,
                          selectionRadius: 40,
                          selectionShape:
                              DateRangePickerSelectionShape.rectangle,
                          initialSelectedRange: PickerDateRange(
                            DateTime(
                                DateTime.now().year, DateTime.now().month, 1),
                            DateTime(DateTime.now().year, DateTime.now().month,
                                daysInMonth),
                          ),
                          monthViewSettings:
                              const DateRangePickerMonthViewSettings(
                                  dayFormat: 'EEE',
                                  enableSwipeSelection: false),
                          selectionColor: Colors.blue,
                          selectionMode: DateRangePickerSelectionMode.range,
                          navigationDirection:
                              DateRangePickerNavigationDirection.horizontal,
                          rangeSelectionColor: Colors.blue.withOpacity(0.4),
                          navigationMode: DateRangePickerNavigationMode.none,
                          headerStyle: DateRangePickerHeaderStyle(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 25,
                                letterSpacing: 5,
                              ),
                              textAlign: TextAlign.center,
                              backgroundColor: Colors.lightBlue[100]),
                        ),
                  Container(
                    color: Colors.white.withOpacity(0.0),
                    height: mediaQuery.height / 3,
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 1 / 8,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const EditScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shadowColor: Colors.black.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(
                    horizontal: mediaQuery.width / 5,
                    vertical: mediaQuery.width / 20),
              ),
              child: const TextWidget(
                text: 'تعديل',
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
