import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seegong_flutter/etc/shadow.dart';
import 'package:seegong_flutter/model/ReservationDayDate.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range/time_range.dart';


var TopButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(153, 153, 153, 1)),
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 255, 255, 1)),
    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 1),
        )
    )
);


var SlectedTopButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(153, 153, 153, 1)),
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(255, 255, 255, 1)),
    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 1),
        )
    )
);
class CalendarViewModel extends GetxController{
  var reserveDate = new ReservationDayDate();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  TextIf(BuildContext context, String description, String setvar, VoidCallback func ) {
    if (setvar == "") {
      return ElevatedButton(
          style: TopButtonStyle,
          onPressed: func,
          child: Text("$description")
      );
    }
    else {
      return ElevatedButton(
          style: SlectedTopButtonStyle,
          onPressed: func,
          child: Text("$setvar")
      );
    }
  }


  String ShowTime() {
    String time = "";
    time += reserveDate.InitTimeHourController;
    time += reserveDate.EndTimeHourController;
    return time;
  }
  void SpecificCalenderView(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 550,
                  child: SfDateRangePicker(
                    view: DateRangePickerView.month,
                    monthViewSettings: DateRangePickerMonthViewSettings(
                      dayFormat: 'EEE',
                    ),
                    monthFormat: 'MMM',
                    showNavigationArrow: true,
                    headerStyle: DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(fontSize: 25, color: Colors.blueAccent),
                    ),
                    headerHeight: 100,
                    allowViewNavigation: false,
                    backgroundColor: ThemeData.light().scaffoldBackgroundColor,
                    initialSelectedDate: DateTime.now(),
                    minDate: DateTime.now(),
                    // 아래코드는 tempPickedDate를 전역으로 받아 시작일을 선택한 날자로 시작할 수 있음
                    //minDate: tempPickedDate,
                    maxDate: DateTime.now().add(new Duration(days: 90)),
                    // 아래 코드는 선택시작일로부터 2주까지밖에 날자 선택이 안됌
                    //maxDate: tempPickedDate!.add(new Duration(days: 14)),
                    selectionMode: DateRangePickerSelectionMode.single,
                    confirmText: '완료',
                    cancelText: '취소',
                    onCancel: () => Navigator.of(context).pop(),
                    showActionButtons: true,
                    onSubmit: (args) {
                      reserveDate.DataTimeEditingController = args.toString();
                      convertDateTimeDisplay(reserveDate.DataTimeEditingController);
                      update();
                    Navigator.of(context).pop();
                    },
                  ),
                ),
              ));
        });
  }


  void convertTimeController() {
    int temp = int.parse(reserveDate.EndTimeHourController) - int.parse(reserveDate.InitTimeHourController);
    if (int.parse(reserveDate.InitTimeMinuteController) > int.parse(reserveDate.EndTimeMinuteController))
      reserveDate.TotalRentTIme = (temp - 1).toString() + "시간 30분";
    else if (reserveDate.InitTimeMinuteController == reserveDate.EndTimeMinuteController)
      reserveDate.TotalRentTIme = temp.toString() + "시간";
    else
      reserveDate.TotalRentTIme = temp.toString() + "시간 30분";

    reserveDate.InitTime = reserveDate.InitTimeHourController + "시" + reserveDate.InitTimeMinuteController;
    if(reserveDate.InitTimeMinuteController.length == 1)
      reserveDate.InitTime += "0";
    reserveDate.InitTime += "분";

    reserveDate.EndTime = reserveDate.EndTimeHourController + "시" + reserveDate.EndTimeMinuteController;
    if(reserveDate.EndTimeMinuteController.length == 1)
      reserveDate.EndTime += "0";
    reserveDate.EndTime += "분";

    reserveDate.InitToEndTime = reserveDate.InitTime +" ~ "+ reserveDate.EndTime;
    update();
  }

  void convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    reserveDate.DataTimeEditingController =
        serverFormater.format(displayDate);
    update();
  }

  void setUsageTime(BuildContext context) {
    showCupertinoDialog(
        context: context, builder: (context){
      return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadowVar],
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 4,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TimeRange(
                        firstTime: TimeOfDay(hour: 9, minute: 0), //시작을 언제하는지?
                        lastTime: TimeOfDay(hour: 24, minute: 0), //종료가 언제인지?
                        fromTitle: Text(
                          '사용할 날짜를 선택하세요!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, letterSpacing: -1.5),
                        activeTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -1.5),
                        timeStep: 30, //30분 간격으로 설정
                        timeBlock: 30,
                        backgroundColor: Colors.white10,
                        activeBackgroundColor: Colors.blueAccent,
                        borderColor: Colors.black.withOpacity(0.5),
                        activeBorderColor: Colors.black.withOpacity(0.5),
                        onRangeCompleted: (range) {
                          reserveDate.InitTimeHourController = range!.start.hour.toString();
                          reserveDate.InitTimeMinuteController = range.start.minute.toString();
                          reserveDate.EndTimeHourController = range.end.hour.toString();
                          reserveDate.EndTimeMinuteController = range.end.minute.toString();
                          convertTimeController();
                          update();
                        },

                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();}, child:
                    Text(
                        '입력완료'
                    ),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                      ),
                    )
                  ],
                )),
          ));
    });
  }
}

class PickerButton extends StatefulWidget {
  BuildContext context;
  String description;
  String value;
  VoidCallback func;
  PickerButton({Key? key,
    required this.context,
    required this.description,
    required this.value,
    required this.func,
  }
      ) : super(key: key);

  @override
  State<PickerButton> createState() => _PickerButtonState();
}

class _PickerButtonState extends State<PickerButton> {
  @override
  Widget build(context) {
    if (widget.value == "") {
      return ElevatedButton(
          style: TopButtonStyle,
          onPressed: widget.func,
          child: Text("${widget.description}")
      );
    }
    else {
      return ElevatedButton(
          style: TopButtonStyle,
          onPressed: widget.func,
          child: FittedBox(fit: BoxFit.scaleDown, child: Text("${widget.value}"))
      );
    }
  }
}
