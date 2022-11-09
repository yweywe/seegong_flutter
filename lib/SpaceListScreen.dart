import 'package:flutter/material.dart';

import 'NavigationMenu.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class SpaceListScreen extends StatelessWidget {
  const SpaceListScreen({Key? key}) : super(key: key);

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
      key: _key,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Text("시소"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            _key.currentState?.openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  minLines: 1,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "장소 이름"
                  ),
                  // controller: todo,
                ),
              ),
              Icon(Icons.search)
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
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
                  return Column(
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
                      )
                    ],
                  );
                }
            ),
          ),
        ],
      ),
      drawer: NavigationMenu(),
    );
  }
}
