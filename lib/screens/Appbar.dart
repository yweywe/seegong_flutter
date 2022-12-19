import 'package:flutter/material.dart';


AppBar Appbarseegong = AppBar(
  backgroundColor: Color(0xff033780),
  toolbarHeight: 80,

  title: Image.asset("assets/images/glob_top_img_none.png",
      fit: BoxFit.contain,
      height: 50),
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