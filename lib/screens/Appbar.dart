import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/viewModel/AppBarViewmodel.dart';


AppBar Appbarseegong = AppBar(
  centerTitle: true,
  backgroundColor: Color(0xff033780),
  toolbarHeight: 80,
  title: GetBuilder<AppBarViewMdoel>(
    init: new AppBarViewMdoel(),
    builder: (_) {
      return GestureDetector(
        onTap: (){_.getSpaceSelect();},
        child: Image.asset("assets/images/glob_top_img_none.png",
          fit: BoxFit.contain,
          width: 64,
          height: 30,
        ),
      );
    }
  ),
  leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          });
    },
  ),
);