import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';

class ReservationScreen extends StatefulWidget {

  // TextEditingController _DataTimeEditingController = TextEditingController(); // DateTimepciker
  // TextEditingController _InitTimeEditngController = TextEditingController();
  // TextEditingController _EndTimeEditingController = TextEditingController();


  const ReservationScreen({Key? key}) : super(key: key);
  static const routename = '/ReservationScreen';


  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  var t1 = SpecificParameter(
    imgurl: 'images/icons/wws.jpeg',
    SpaceName: '작은 천사들 교육장',
    Spaceintroduction: '회의실 혹은 강의실로 사용할 수 있습니다.',
  );

  String AlertMessageFromSeegong = "3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가";
  String RefundPolicyInformation = "이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.";
  var arg = ReservationArguments();
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ToReservArgument;
    print(args);
    var size = MediaQuery.of(context).size;
    var SmallFontSize = size.width / 30;

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${t1.SpaceName}', style: TextStyle(fontSize: size.width / 22, fontWeight: FontWeight.w700, letterSpacing: -1),),
                      Text('${t1.price}', style: TextStyle(fontSize: size.width / 22,fontWeight: FontWeight.w700, letterSpacing: -1),),
                      Text('${args.TotalRentTIme.text}', style: TextStyle(fontSize: size.width / 22,fontWeight: FontWeight.w700, letterSpacing: -1),),
                    ],
                  ),
                ),

                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    child: Text('예약 정보', style: TextStyle(fontSize: 20),),
                  onTap: ()=>Navigator.pushNamed(context, SpecificScreen.routename),
                ),
                SizedBox(height: 3,),
                Container(width: MediaQuery.of(context).size.width, height: 3, color: Colors.black.withOpacity(0.4),),
                SizedBox(height: 3,),

                Row(
                  children: [
                    Container(
                        width: size.width / 6.5,
                        child: FittedBox(fit:BoxFit.scaleDown,child: Text('예약 날짜', style: TextStyle(fontSize: size.width / 30),))),
                    Container(width: size.width / 30,),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        width:  size.width / 1.6,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FittedBox(fit:BoxFit.scaleDown,child: Text('${args.DataTimeEditingController.text}', style: TextStyle(fontSize: size.width / 30),)),
                            FittedBox(fit:BoxFit.scaleDown,child: Text('${args.InitTimeEditngController.text}', style: TextStyle(fontSize: size.width / 30),)),
                            FittedBox(fit:BoxFit.scaleDown,child: Text('${args.EndTimeEditingController.text}', style: TextStyle(fontSize: size.width / 30),)),
                          ],
                        ),),
                    )
                  ],
                ),

                Row(
                  children: [
                    Container(
                        width: size.width / 6.5,
                        child: FittedBox(fit:BoxFit.scaleDown,child: Text('예약 인원', style: TextStyle(fontSize: size.width / 30),))),
                    Container(width: size.width / 30,),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        width:  size.width / 8,
                        height: 30,
                        child: ReservTextFiledWidget(controller: arg.NumberofPeople, HintText: '0'),),
                    )
                  ],
                ),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('예약자 정보', style: TextStyle(fontSize: 20),),
                    Text('* 필수 입력', style: TextStyle(fontSize: 10, color: Colors.red),)
                  ],
                ),
                SizedBox(height: 3,),
                Container(width: MediaQuery.of(context).size.width, height: 3, color: Colors.black.withOpacity(0.4),),
                SizedBox(height: 3,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: size.width / 6.5,
                                  child: FittedBox(fit:BoxFit.scaleDown,child: Text('예약자 *', style: TextStyle(fontSize: size.width / 30),))),
                              Container(width: size.width / 30,),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  width:  size.width / 1.6,
                                  height: 30,
                                  child: ReservTextFiledWidget(controller: arg.ReservationName, HintText: ''),),
                              )
                            ],
                          ),
                          Container(height: 10,),

                          Row(
                            children: [
                              Container(
                                  width: size.width / 6.5,
                                  child: FittedBox(fit:BoxFit.scaleDown,child: Text('연락처 *', style: TextStyle(fontSize: size.width / 30),))),
                              Container(width: size.width / 30,),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  width:  size.width / 1.6,
                                  height: 30,
                                  child: ReservTextFiledWidget(controller: arg.PhoneNumber, HintText: ''),),
                              )
                            ],
                          ),
                          Container(height: 10,),


                          Row(
                            children: [
                              Container(
                                  width: size.width / 6.5,
                                  child: FittedBox(fit:BoxFit.scaleDown,child: Text('이메일 *', style: TextStyle(fontSize: size.width / 30),))),
                              Container(width: size.width / 30,),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  width:  size.width / 1.6,
                                  height: 30,
                                  child: ReservTextFiledWidget(controller: arg.Email, HintText: ''),),
                              )
                            ],
                          ),
                          Container(height: 10,),


                          Row(
                            children: [
                              Container(
                                  width: size.width / 6.5,
                                  child: FittedBox(fit:BoxFit.scaleDown,child: Text('사용목적 *', style: TextStyle(fontSize: size.width / 30),))),
                              Container(width: size.width / 30,),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  width:  size.width / 1.6,
                                  height: 45,
                                  child: ReservTextFiledWidget(controller: arg.PurposeofUse, HintText: ''),),
                              )
                            ],
                          ),
                          Container(height: 10,),


                          Row(
                            children: [
                              Container(
                                  width: size.width / 6.5,
                                  child: FittedBox(fit:BoxFit.scaleDown,child: Text('요청사항  ', style: TextStyle(fontSize: size.width / 30),))),
                              Container(width: size.width / 30,),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height: 100,
                                  width:  size.width / 1.6,
                                  child: ReservTextFiledWidget(controller: arg.ReservaitonClientRequest, HintText: ''),),
                              )
                            ],
                          ),
                          //EditableText(controller: controller, focusNode: focusNode, style: style, cursorColor: cursorColor, backgroundCursorColor: backgroundCursorColor),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                  child: Text('공간 정보', style: TextStyle(fontSize: size.width / 25, letterSpacing: -1),),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5)
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                              child: Container(
                                alignment: AlignmentDirectional.centerEnd,
                                  child: Text('공간 상호', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),))),
                          Expanded(child: Container(),flex: 1,),
                          Expanded(
                            flex: 7,
                              child: Text('${t1.SpaceName}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),)),

                        ],
                      ), SizedBox(height: 10,),



                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text('공간 상호', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),))),
                          Expanded(child: Container(),flex: 1,),
                          Expanded(
                              flex: 7,
                              child: Text('${t1.SpaceOwnerName}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),)),

                        ],
                      ), SizedBox(height: 15,),

                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text('소재지', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),))),
                          Expanded(child: Container(),flex: 1,),
                          Expanded(
                              flex: 7,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                  child: Text('${t1.SpaceLocation}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),))),

                        ],
                      ), SizedBox(height: 15,),



                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text('사업자 번호', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),))),
                          Expanded(child: Container(),flex: 1,),
                          Expanded(
                              flex: 7,
                              child: Text('${t1.SpaceOwnerCompanyNumber}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),)),

                        ],
                      ), SizedBox(height: 15,),



                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text('연락처', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),))),
                          Expanded(child: Container(),flex: 1,),
                          Expanded(
                              flex: 7,
                              child: Text('${t1.SpaceOnwerCompanyPhoneNumber}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),)),

                        ],
                      ), SizedBox(height: 15,),

                    ],
                  ),
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
                  child: Text('예약시 주의사항', style: TextStyle(fontSize: size.width / 25, letterSpacing: -1),),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5)
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
                  child: Column(
                    children: [
                      Text('${AlertMessageFromSeegong}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),), SizedBox(height: 10,),
                    ],
                  ),
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
                  child: Text('환불 규정 안내', style: TextStyle(fontSize: size.width / 25, letterSpacing: -1),),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5)
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Column(
                    children: [
                      Text('${RefundPolicyInformation}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),), SizedBox(height: 10,),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1)
                ),
              ),
            ],
          ),


          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
              child: Text('예약 신청하기', style: TextStyle(fontSize: 30, letterSpacing: -1, fontWeight: FontWeight.w700),),
            ),
            decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.6)
            ),
          ),


        ],



      ),
    );
  }
}

class ReservTextFiledWidget extends StatelessWidget {
  const ReservTextFiledWidget({
    Key? key,
    required this.controller,
    required this.HintText
  }) : super(key: key);

  final TextEditingController controller;
  final String HintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.left,
      controller: controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
        ),
        hintText: '$HintText',
      ),
      style: TextStyle(
        fontSize: 15
      ),
    );
  }
}

class ReservationArguments {
  TextEditingController NumberofPeople = new TextEditingController();
  TextEditingController ReservationName = new TextEditingController();
  TextEditingController PhoneNumber = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController PurposeofUse = new TextEditingController();
  TextEditingController ReservaitonClientRequest = new TextEditingController();
}

