import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';
import 'NavigationMenu.dart';

class SpaceListScreen extends StatelessWidget {
  const SpaceListScreen({Key? key}) : super(key: key);
  static final routename = '/SpaceListScreen';
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> testList = [
      {
        "title": "장소명",
        "dong": "정왕본동",
        "cost_hr": "30000",
        "max_people": 30,
        "img_url": "images/imgs/wws.jpeg"
      },
      {
        "title": "장소명",
        "dong": "정왕본동",
        "cost_hr": "30000",
        "max_people": 30,
        "img_url": "images/imgs/wws.jpeg"
      },
    ];

    return Scaffold(
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
                    padding: const EdgeInsets.all(8.0),
                    child:  TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                            color: Colors.black
                          )
                        ),
                          fillColor: Colors.black,
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){}, child: Text("날짜")),
              ElevatedButton(onPressed: (){}, child: Text("시작시간")),
              ElevatedButton(onPressed: (){}, child: Text("인원")),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
                itemCount: testList.length,
                itemBuilder: (context, idx){
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.pushNamed(context, SpecificScreen.routename);
                    },
                    child: Column(
                      children: [
                        Image.asset(testList[idx]["img_url"]),
                        Row(
                          children: [
                            Text(testList[idx]["title"]),
                            Text(testList[idx]["dong"])],
                        ),
                        Row(
                          children: [
                            Text("${testList[idx]["cost_hr"]}원/시간"),
                            Icon(Icons.person),
                            Text("최대 ${testList[idx]["max_people"]}인")],
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
