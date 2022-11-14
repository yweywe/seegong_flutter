import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SpecificCalendar extends StatefulWidget {
  const SpecificCalendar({Key? key}) : super(key: key);

  @override
  State<SpecificCalendar> createState() => _SpecificCalendarState();
}

class _SpecificCalendarState extends State<SpecificCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfDateRangePicker(

        ),
      ),
    );
  }
}
