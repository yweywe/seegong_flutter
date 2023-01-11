import 'package:flutter/material.dart';


TextIf(BuildContext context, String str, String dtfm, double size) {
  if (dtfm == "") {
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
        '${dtfm}',
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