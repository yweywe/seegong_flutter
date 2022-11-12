import 'package:flutter/material.dart';

class SpaceSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SpaceSelectScreen',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print("Menu button is clicked");
                }),
            title: Image.asset("assets/images/glob_top_img_none.png",
                fit: BoxFit.contain,
                height: 50),
          ),
            body: Container(
              //padding: EdgeInsets.only(top:200),
              child: GridView.count(
                // 가로
                crossAxisCount: 4,
                // 전체
                children: List.generate(12, (index) {
                  return Center(
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            print("Item $index pressed");
                          },
                        ),
                        Text(
                          "Item $index"
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
        )
    );
  }
}