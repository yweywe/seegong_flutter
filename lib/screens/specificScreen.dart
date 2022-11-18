
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                //장소 사진에 대해서...
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadowVar
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('${t1.imgurl}')
                    )
                  ),
                ),
                SizedBox(height: 10,),

                //장소 명, 장소 소개
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${t1.SpaceName}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1.5
                          ),
                        ),

                        Text(
                          '${t1.Spaceintroduction}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 15,),



                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.black.withOpacity(0.3),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          SpecificCalenderView(context); // 날짜 선택
                        },
                        child: TextIf(context, '희망 날짜', DataTimeEditingController, 15)
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          test(context);
                        },
                        child: TextIf( context, '시작 시간 선택', InitTimeEditngController, 15)
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          print(InitTimeEditngController.text);
                          print(EndTimeEditingController.text);
                        },
                        child: TextIf( context, '시작 시간 선택', EndTimeEditingController, 15)
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 60,),
                Column(
                  children: [
                    Text('오시는 길',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.4
                    ),),
                    SizedBox(height: 10,),

                    //구글 맵 들어갈 자리
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      child: GMap(),
                      //color: Colors.black,
                    ),
                    SizedBox(height: 40,),

                    Container(
                      padding: EdgeInsets.all(3),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('공간 소개'),
                          SizedBox(height: 3,),
                          Container(width: MediaQuery.of(context).size.width, height: 3, color: Colors.black.withOpacity(0.4),),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text('${t1.Spaceintroduction}'),
                                    SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        Text('영업시간 '),
                                        Text('${t1.OpeningsHours}'),
                                      ],
                                    ),
                                    SizedBox(height: 3,),

                                    Row(
                                      children: [
                                        Text('휴무일 '),
                                        Text('${t1.Holiday}'),
                                      ],
                                    ),


                                  ],
                                ),
                              )


                            ],
                          ), SizedBox(height: 20,),
                          Text('시설 안내'),
                          SizedBox(height: 3,),
                          Container(width: MediaQuery.of(context).size.width, height: 3, color: Colors.black.withOpacity(0.4),),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text('${t1.RoomItem}'),
                                    SizedBox(height: 3,),
                                  ],
                                ),
                              )
                            ],
                          ),SizedBox(height: 30,),


                        ],
                      ),
                    ),



                  ],
                ),





              ],
            ),
          ),



          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                  child: Text('예약시 주의사항'),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5)
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                  child: Text('$AlertMessageFromSeegong'),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1)
                ),
              ),
            ],
          ),

          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                  child: Text('예약시 주의사항'),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5)
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                  child: Text('$RefundPolicyInformation'),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1)
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    print(EndTimeEditingController);
                    print(InitTimeEditngController);
                    print(DataTimeEditingController);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 50,
                    color: Colors.black.withOpacity(0.3),
                    alignment: Alignment.center,
                    child: Text('전화'),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  height: 50,
                  color: Colors.black.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: GestureDetector(child: Text('예약 신청하기'),
                  onTap: (){
                    if(DataTimeEditingController.text != '' && InitTimeEditngController.text != '' && EndTimeEditingController.text != '') {
                      Navigator.pushNamed(context, ReservationScreen.routename,
                          arguments: ToReservArgument(
                              DataTimeEditingController,
                              InitTimeEditngController,
                              EndTimeEditingController,
                              TotalRentTIme
                          ));}
                    else {
                      print("뭔가 이상함");
                    }

                    },
                  ),
                ),
              ],
            ),
          )



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
                        //tempPickedDate = args as DateTime?;
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


  void test(BuildContext context) {
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
                          firstTime: TimeOfDay(hour: 9, minute: 0),
                          lastTime: TimeOfDay(hour: 24, minute: 0),
                          fromTitle: Text(
                            '시작시간을 선택하세요',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87, letterSpacing: -1.5),
                          activeTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -1.5),
                          timeStep: 30,
                          timeBlock: 30,
                          backgroundColor: Colors.white10,
                          activeBackgroundColor: Colors.orange,
                          borderColor: Colors.black.withOpacity(0.5),
                          activeBorderColor: Colors.black.withOpacity(0.5),

                          onRangeCompleted: (range) => setState(() {
                            SetconvertTimeDisplay(range!);
                            print(range.start.hour);
                            print(range);
                            print(range.end.hour);
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
      alignment: Alignment.center,
      child: Text(
          '$str',
          style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.4)

          )
      ),
    );
  }
  else {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '${dtfm.text}',
        style: TextStyle(
          fontSize: size,
          color: Colors.black.withOpacity(0.8),
        ),
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
        mapType: MapType.hybrid,
        initialCameraPosition: _lAngels,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}