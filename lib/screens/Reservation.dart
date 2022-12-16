import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/screens/ReservationResult.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();

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
    var size = MediaQuery.of(context).size;
    var SmallFontSize = size.width / 30;

    return Scaffold(
      appBar:  Appbarseegong,
      drawer: NavigationMenu(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
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

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '예약 내용',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                ),
                              ),
                              SizedBox(height: 9,),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '장소 이름',
                                        style: TextStyle(
                                          color: Color(0xff434849),
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                        '작은 천사들',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                            color: Color(0xff333333)
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(height: 6,),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '가격',
                                        style: TextStyle(
                                            color: Color(0xff434849)
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                        '300,000',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                            color: Color(0xff333333)
                                        ),
                                      ))

                                ],
                              ),
                              SizedBox(height: 6,),

                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '시간',
                                        style: TextStyle(
                                            color: Color(0xff434849)
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                        '2시간',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                            color: Color(0xff333333)
                                        ),
                                      ))

                                ],
                              ),
                              SizedBox(height: 6,),

                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '예약 날짜',
                                        style: TextStyle(
                                            color: Color(0xff434849)
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                        '2022.12.25 (토)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff333333)
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(height: 6,),



                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        '예약 인원',
                                        style: TextStyle(
                                            color: Color(0xff434849)
                                        ),
                                      )
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: Text(
                                        '2명',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff333333)
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(height: 6,),
                            ],
                          ),
                        ),

                        SizedBox(height: 20,),




                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '예약자 정보',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            SizedBox(height: 15,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Text(
                                        '이름'
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                          color: Colors.red
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    height: 35,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '이름을 입력하세요',
                                        hintStyle: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff333333).withOpacity(0.3),
                                        )
                                      ),
                                    ),
                                  )

                                )
                              ],
                            ),
                            SizedBox(height: 8,),

                            //연락처 Textfiled
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Text(
                                          '연락처'
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                            color: Colors.red
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      height: 35,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '연락처를 입력하세요',
                                            hintStyle: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff333333).withOpacity(0.3),
                                            )
                                        ),
                                      ),
                                    )

                                )
                              ],
                            ),
                            SizedBox(height: 8,),



                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Text(
                                          '이메일'
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                            color: Colors.red
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      height: 35,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '이메일을 입력하세요',
                                            hintStyle: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff333333).withOpacity(0.3),
                                            )
                                        ),
                                      ),
                                    )

                                )
                              ],
                            ),
                            SizedBox(height: 8,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Text(
                                          '사용목적'
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        '*',
                                        style: TextStyle(
                                            color: Colors.red
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      height: 35,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '사용목적을 입력하세요',
                                            hintStyle: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff333333).withOpacity(0.3),
                                            )
                                        ),
                                      ),
                                    )

                                )
                              ],
                            ),
                            SizedBox(height: 8,),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Text(
                                          '요청사항'
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        ' ',
                                        style: TextStyle(
                                            color: Colors.red
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Expanded(
                                    flex: 8,
                                    child: TextField(
                                      maxLines: 3,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: '요청사항을 입력하세요',
                                          hintStyle: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff333333).withOpacity(0.3),
                                          )
                                      ),
                                    )

                                )
                              ],
                            ),
                            SizedBox(height: 35,)
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '공간 정보',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            SizedBox(height: 15,),


                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      '공간 상호',
                                      style: TextStyle(
                                        color: Color(0xff434849),
                                      ),
                                    )
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Text(
                                      '공간 상호를 입려갛세요',
                                      style: TextStyle(
                                          color: Color(0xff999999)
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 8,),


                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      '대표자명',
                                      style: TextStyle(
                                        color: Color(0xff434849),
                                      ),
                                    )
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Text(
                                      '엄영욱',
                                      style: TextStyle(
                                          color: Color(0xff999999)
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 8,),



                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      '소재지',
                                      style: TextStyle(
                                        color: Color(0xff434849),
                                      ),
                                    )
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Text(
                                      '시흥시 어딘가',
                                      style: TextStyle(
                                          color: Color(0xff999999)
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 8,),


                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      '사업자 번호',
                                      style: TextStyle(
                                        color: Color(0xff434849),
                                      ),
                                    )
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Text(
                                      '1234',
                                      style: TextStyle(
                                          color: Color(0xff999999)
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 8,),

                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      '연락처',
                                      style: TextStyle(
                                        color: Color(0xff434849),
                                      ),
                                    )
                                ),
                                Expanded(
                                    flex: 8,
                                    child: Text(
                                      '1234-1234-1423',
                                      style: TextStyle(
                                          color: Color(0xff999999)
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 8,),
                          ],
                        ),
                        SizedBox(height: 35,),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '환불시 주의사항',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            SizedBox(height: 10,),

                            Row(
                              children: [
                                Text(
                                  '3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가',
                                  style: TextStyle(
                                      color: Color(0xff999999)
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),SizedBox(height: 30,),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '예약시 주의사항',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                            SizedBox(height: 10,),

                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.',
                                    style: TextStyle(
                                        color: Color(0xff999999)
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 35,),

                          ],
                        ),


                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, ResultScreen.routename);
                          },
                              child: Text('예약 신청하기',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white
                                ),),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff033780)
                              )
                          ),
                        ),


                      ],
                    ),
                  ),



                ],
              ),
            ),

          ],



        ),
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

