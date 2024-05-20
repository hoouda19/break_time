import 'package:break_time/main.dart';
import 'package:break_time/model/calendar_model.dart';
import 'package:break_time/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/text_widget.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<EditScreen> {
  var listNumbers = [for (var i = 1; i < 32; i++) i];
  int workValue = 1;
  int holidayValue = 1;
  bool calendarHijriType = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    // var mainColor = Colors.lightBlue[100];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Break Time'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Switch(
                        activeColor: Colors.blueAccent,
                        onChanged: (bool value) {
                          setState(() {
                            calendarHijriType = value;
                          });
                        },
                        value: calendarHijriType,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextWidget(
                        text: 'التاريخ الهجري',
                        size: 27,
                      ),
                    ],
                  ),
                  Image.asset('assets/images/main.png',
                      width: mediaQuery.height * 1 / 2),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child: TextFieldWidget(
                  //     controller: controller,
                  //     lable: 'عدد الأيام',
                  //     initText: '1',
                  //   ),
                  // ),
                  SizedBox(
                    height: mediaQuery.width / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: mediaQuery.width / 2,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          alignment: Alignment.center,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.black),
                          icon: const Icon(
                            Icons
                                .arrow_drop_down, //   Icons.calendar_month_outlined,
                          ),
                          underline: const SizedBox(),
                          iconSize: 30,
                          value: workValue,
                          items: listNumbers
                              .map<DropdownMenuItem>(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: SizedBox(
                                      width: mediaQuery.width / 3,
                                      child: Text(e.toString())),
                                ),
                              )
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              workValue = newValue;
                            });
                          },
                        ),
                      ),
                      const TextWidget(
                        text: 'ايام الدوام',
                        size: 27,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.width / 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: mediaQuery.width / 2,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(
                          alignment: Alignment.center,
                          style: const TextStyle(
                              fontSize: 25, color: Colors.black),
                          icon: const Icon(
                            Icons
                                .arrow_drop_down, //   Icons.calendar_month_outlined,
                          ),
                          underline: const SizedBox(),
                          iconSize: 30,
                          value: holidayValue,
                          items: listNumbers
                              .map<DropdownMenuItem>(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: SizedBox(
                                      width: mediaQuery.width / 3,
                                      child: Text(e.toString())),
                                ),
                              )
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              holidayValue = newValue;
                            });
                          },
                        ),
                      ),
                      const TextWidget(
                        text: 'ايام الاجازة',
                        size: 27,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.width / 10,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        calendarType.put('calendarType', calendarHijriType);
                        boxes.put(
                            'CalendarModel',
                            CalendarModel(
                                workValue: workValue,
                                holidayValue: holidayValue,
                                firstScreen: 1));

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shadowColor: Colors.black.withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQuery.width / 5,
                            vertical: mediaQuery.width / 20),
                      ),
                      child: const TextWidget(
                        text: 'تاكيد',
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: mediaQuery.width / 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
