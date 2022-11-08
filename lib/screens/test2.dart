import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/Rservation.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            Container(
              child: Text(
                'TEST2'
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, ReservationScreen.routename);
            }, child: Text(
              '1번화면'
            )),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, SpecificScreen.routename);
            }, child: Text(
                '1번화면'
            )),
          ],
        ),
      ),
    );
  }
}
