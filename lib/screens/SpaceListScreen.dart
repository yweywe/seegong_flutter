import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/viewModel/CalendarVIewModel.dart';
import 'package:seegong_flutter/viewModel/SpaceViewModel.dart';
import 'NavigationMenu.dart';


class SpaceListScreen extends StatelessWidget {
  const SpaceListScreen({Key? key}) : super(key: key);
  static final routename = '/SpaceListScreen';
  @override
  Widget build(BuildContext context) {
    // List<Map<dynamic, dynamic>> testList = [
    //   {
    //     "title": "공본 스터디카페",
    //     "dong": "경기 고양시 일산동구 위시티4로 45 3층",
    //     "cost_hr": "30000",
    //     "max_people": 30,
    //     "img_url": "images/imgs/wws.jpeg"
    //   },
    //   {
    //     "title": "이든샘 스터디카페",
    //     "dong": "경기 고양시 일산동구 위시티4로 45 3층",
    //     "cost_hr": "30000",
    //     "max_people": 30,
    //     "img_url": "images/imgs/wws.jpeg"
    //   },
    // ];
    return GetBuilder<SpaceViewModel>(
      init: new SpaceViewModel(),
      builder: (__) {
        if (__.fbState == 0) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else return Scaffold(
          drawerEnableOpenDragGesture: false,
          appBar: Appbarseegong,
          drawer: NavigationMenu(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding : const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                        child:  TextField(

                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,

                          decoration: InputDecoration(
                            hintText: "검색어를 입력해주세요.",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  // width: 0,
                                  color: Color.fromRGBO(244, 245, 247, 100)
                              )
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(244, 245, 247, 100),
                            prefixIcon:Icon(Icons.search),
                        ),
                        // child: TextField(
                        //   minLines: 1,
                        //   maxLines: 1,
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //     labelText: "장소 이름"
                        //   ),
                        //   // controller: todo,
                        // ),
                      ),
                    ),)
                  ],
                ),
              ),
              GetBuilder<CalendarViewModel>(
                init: new CalendarViewModel(),
                builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Expanded(flex: 5, child: SizedBox()),
                        Expanded(
                          flex: 100,
                          child: PickerButton(
                            context: context,
                            description: '날짜 선택',
                            func: ()=>_.SpecificCalenderView(context),
                            value: _.reserveDate.DataTimeEditingController,
                          )
                        ),
                        Expanded(flex: 10, child: SizedBox()),
                        Expanded(
                          flex: 100,
                          child: PickerButton(
                            context: context,
                            description: '시간 선택',
                            func: ()=>_.setUsageTime(context),
                            value: _.reserveDate.InitToEndTime,
                          )
                        ),
                        Expanded(flex: 10, child: SizedBox()),
                        Expanded(
                          flex: 100,
                          child: PickerButton(
                            context: context,
                            description: '인원 선택',
                            func: ()=>_.setUsageTime(context),
                            value: "",
                          )
                        ),
                        // Expanded(flex: 5, child: SizedBox()),
                      ],
                    ),
                  );
                }
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: __.spaceListFromFB.length,
                    itemBuilder: (context, idx){
                      var lastTextStyle = TextStyle(color: Color.fromRGBO(153, 153, 153, 1), fontSize: 12);
                      return GestureDetector(
                        onTap: () {
                          __.getSpaceDetail(idx);
                        },
                        child: Padding(
                          /// 장소 하나 표시하는 패딩
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                child: SizedBox(
                                  /// 장소 이름
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
                                    child: Text("${__.spaceListFromFB[idx].space_name}", /// tb_space -> space_name
                                      style: TextStyle(fontSize: 18, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,),
                                  )
                                ),
                              ),
                              ClipRRect(
                                /// 장소 사진 표시
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network("${__.spaceListFromFB[idx].space_image}"), // tb_space.space_image
                              ),
                              Padding(
                                /// 장소 주소 표시
                                padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 4.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text("${__.spaceListFromFB[idx].addr}", /// tb_space -> addr
                                    style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1), fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,)
                                )
                              ),
                              Padding(
                                /// 장소 가격, 인원 표시
                                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    /// 현 테이블에 없음(우리 정했었나?) => tb_space_price -> default_fee_r
                                    /// 혹은 tb_space -> free_yn (yes/no인데 15B 컬럼인 것이 해당 정보가 있을 듯 함)
                                    //Text("${testList[idx]["cost_hr"]}원/시간", style: lastTextStyle),
                                    Text("${__.spaceListFromFB[idx].base_payInfo}원/시간", style: lastTextStyle),
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Color.fromRGBO(153, 153, 153, 1)),
                                        Text("최대 ${__.spaceListFromFB[idx].capacity}인", style: lastTextStyle,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Divider(height: 1, color: Color.fromRGBO(219, 219, 219, 1), thickness: 1),
                              SizedBox(height: 20)
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
