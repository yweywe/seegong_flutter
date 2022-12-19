
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seegong_flutter/etc/ReserveTextClass.dart';
import 'package:seegong_flutter/etc/color.dart';
import 'package:seegong_flutter/etc/shadow.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/Reservation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'NavigationMenu.dart';

class SpecificScreen extends StatefulWidget {
  const SpecificScreen({Key? key}) : super(key: key);
  static const routename = '/SpecificScreen';

  @override
  State<SpecificScreen> createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {
  TextEditingController DataTimeEditingController = TextEditingController(); // DateTimepciker
  TextEditingController InitTimeEditngController = TextEditingController();
  TextEditingController EndTimeEditingController = TextEditingController();
  TextEditingController TotalRentTIme = TextEditingController();

  var t1 = SpecificParameter(
    imgurl: 'images/icons/wws.jpeg',
    SpaceName: '작은 천사들 교육장',
    Spaceintroduction: '회의실 혹은 강의실로 사용할 수 있습니다.',
  );

  String AlertMessageFromSeegong = "3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가";
  String RefundPolicyInformation = "이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarseegong,
      drawer: NavigationMenu(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('${t1.imgurl}')
                )
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                //장소 명, 장소 소개
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${t1.SpaceName}', // 작은 천사들 교육장 / 장소 명
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1.5
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //위
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xff033780),
                                    ),
                                    SizedBox(width: 3,),
                                    Text(
                                      '경기 고양시 일산동구 위시티4로 45 3층',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff666666)
                                      ),
                                    )
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Color(0xff033780),
                                    ),
                                    SizedBox(width: 3,),

                                    Text(
                                      '010-0000-0000',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff666666)
                                      ),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 15,),


                    SizedBox(height: 5,),

                    Row(
                      children: [
                        Expanded(
                          flex: 100,
                          child: GestureDetector(
                            onTap: (){
                              SpecificCalenderView(context); // 날짜 선택
                            },
                            child: TextIf(context, '희망 날짜', DataTimeEditingController, 15)
                          ),
                        ),
                        Expanded(flex: 5, child: SizedBox()),
                        Expanded(
                          flex: 100,
                          child: GestureDetector(
                            onTap: (){
                              setUsageTime(context);
                            },
                            child: TextIf( context, '시작 시간 선택', InitTimeEditngController, 15)
                          ),
                        ),
                        Expanded(flex: 5, child: SizedBox()),
                        Expanded(
                          flex: 100,
                          child: GestureDetector(
                            onTap: (){
                              print(InitTimeEditngController.text);
                              print(EndTimeEditingController.text);
                            },
                            child: TextIf( context, '종료 시간 선택', EndTimeEditingController, 15)
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 60,),
                  ],
                ),

                /* 오시는 길 부분 */
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '오시는 길'),
                    //구글 맵 들어갈 자리
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: GMap(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //color: Colors.black,
                    ),
                    SizedBox(height: 40,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadText(headText: '공간 소개'),
                            DescriptLight(subject: '한줄 소개',description: '공간 소개'),
                            DescriptLight(subject: '영업 시간',description: '0900 ~ 1600'),
                            DescriptLight(subject: '휴무일', description: '주말 휴무'),
                          ],
                        ), SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadText(headText: '환불시 주의사항'),
                            DescriptCaution(descrpitText: '3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가'),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadText(headText: '환불시 주의사항'),
                            DescriptCaution(descrpitText: '이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.'),
                            SizedBox(height: 20,),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /*예약하기 버튼*/
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: GestureDetector(
              child: ColorButton(buttonText: '예약하기'),
              onTap: () {
                if (DataTimeEditingController.text != '' &&
                    InitTimeEditngController.text != '' &&
                    EndTimeEditingController.text != '') {
                  Navigator.pushNamed(context, ReservationScreen.routename,
                      arguments: ToReservArgument(
                          DataTimeEditingController,
                          InitTimeEditngController,
                          EndTimeEditingController,
                          TotalRentTIme));
                } else {
                  print("뭔가 이상함");
                }
              },
            ),
          ),



        ],
      ),
    );
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
                    onSubmit: (args) => {
                      setState(() {
                        DataTimeEditingController.text = args.toString();
                        convertDateTimeDisplay(
                            DataTimeEditingController.text);
                        Navigator.of(context).pop();
                      }),
                    },
                  ),
                ),
              ));
        });
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
                            '123',
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
                          activeBackgroundColor: Colors.orange,
                          borderColor: Colors.black.withOpacity(0.5),
                          activeBorderColor: Colors.black.withOpacity(0.5),

                          onRangeCompleted: (range) => setState(() {
                            DateTime.now();
                            SetconvertTimeDisplay(range!);
                          } ),

                        ),
                      ),

                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();}, child:
                      Text(
                        '입력완료'
                      ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white.withOpacity(0),

                        ),
                      )
                    ],
                  )),
      ));
    });
  }




  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    return DataTimeEditingController.text =
        serverFormater.format(displayDate);
  }

  void SetconvertTimeDisplay(TimeRangeResult data) {
    String tempTime = '30';

    TotalRentTIme.text = (data.end.hour - data.start.hour).toString();
    if (data.start.minute > data.end.minute) {
      TotalRentTIme.text = (int.parse(TotalRentTIme.text) - 1).toString();
      TotalRentTIme.text += '시간 30분';
    }
    else{
      TotalRentTIme.text += '시간 ';
      TotalRentTIme.text += data.end.minute.toString();
    }

    InitTimeEditngController.text = data.start.hour.toString();
    InitTimeEditngController.text += '시 ';
    InitTimeEditngController.text += data.start.minute.toString();


    EndTimeEditingController.text = data.end.hour.toString();
    EndTimeEditingController.text += '시 ';
    EndTimeEditingController.text += data.end.minute.toString();

    if (data.start.minute.toString().length == 1)
      InitTimeEditngController.text += '0';
    if (data.end.minute.toString().length == 1)
      EndTimeEditingController.text += '0';


    InitTimeEditngController.text += '분 ';
    EndTimeEditingController.text += '분 ';

  }


}

class SpecificParameter {
  String? imgurl;
  String? SpaceName;
  String? Spaceintroduction;
  String? OpeningsHours;
  String? Holiday;
  //Room Item 어떻게 할 것인지?
  String? RoomItem;

  int? price;
  String? SpaceOwnerName;
  String? SpaceLocation;
  String? SpaceOwnerCompanyNumber;
  String? SpaceOnwerCompanyPhoneNumber;

  SpecificParameter({
    this.price = 100000,
    this.imgurl = 'images/imgs/wws.jpeg',
    this.SpaceName = '???',
    this.Spaceintroduction,
    this.OpeningsHours = '9:00 ~ 1900',
    this.Holiday = '토 일',
    this.RoomItem = '',
    this.SpaceOwnerName ='김김김',
    this.SpaceLocation = '경기도 시흥시 시재로 19성윤빌딩 5층 502호',
    this.SpaceOwnerCompanyNumber = '12345678900',
    this.SpaceOnwerCompanyPhoneNumber = '01062495493'
  });
}



TextIf(BuildContext context, String str, TextEditingController dtfm, double size) {
  if (dtfm.text == "") {
    return Container(
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Color(0xff999999),
        )
      ),
      child: Text(
          '$str',
          style: TextStyle(
              fontSize: 16,
              color: Color(0xff999999),

          )
      ),
    );
  }
  else {
    return Container(
      height: 45,

      alignment: Alignment.center,
      child: Text(
        '${dtfm.text}',
        style: TextStyle(
          fontSize: size,
          color: Color(0xff428AF0),
        ),
      ),

      decoration: BoxDecoration(
        color: Color(0xff0057D0).withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1,
            color: Color(0xff428AF0),
          )
      ),
    );
  }
}


class ToReservArgument {
  TextEditingController DataTimeEditingController; // DateTimepciker
  TextEditingController InitTimeEditngController;
  TextEditingController EndTimeEditingController;
  TextEditingController TotalRentTIme;
  ToReservArgument(
      this.DataTimeEditingController,
      this.InitTimeEditngController,
      this.EndTimeEditingController,
      this.TotalRentTIme
      );
}


class GMap extends StatefulWidget {
  @override
  State<GMap> createState() => GMapState();
}

class GMapState extends State<GMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _lAngels = CameraPosition(
      target: LatLng(37.381111, 126.802245),
      zoom: 15
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _lAngels,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
