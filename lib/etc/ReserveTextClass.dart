
import 'package:flutter/material.dart';

class ReserveTextFiled extends StatelessWidget {
  bool escential;
  String textformSubject;
  String textformHint;
  int? maxline;
  TextEditingController textController;
  ReserveTextFiled({Key? key,
    this.escential = true,
    required this.textformSubject,
    required this.textformHint,
    required this.textController,
    this.maxline = 1
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: maxline == 1? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Text(
                      '$textformSubject'
                  ),
                  SizedBox(width: 3,),
                  Text( escential == true ? '*': '',
                    style: TextStyle(
                        color: Colors.red
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 10,
                child: Container(
                  height: maxline == 1? 35 : null,
                  child: TextField(
                    controller: textController,
                    textAlign: TextAlign.start,
                    maxLines: maxline,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '$textformHint',
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
      ],
    );
  }
}


class DescriptCaution extends StatelessWidget {
  String descrpitText;
  DescriptCaution({Key? key,
    required this.descrpitText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            '$descrpitText',
            style: TextStyle(
                color: Color(0xff999999)
            ),
          ),
        )
      ],
    );
  }
}

class ColorButton extends StatelessWidget {
  String buttonText;
  ColorButton({Key? key,
    required this.buttonText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff033780)
      ),
      child: Text('$buttonText',
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
        ),),
    );
  }
}
// child: Text('$buttonText',
// style: TextStyle(
// fontSize: 18,
// color: Colors.white
// ),),
// style: ElevatedButton.styleFrom(
// backgroundColor: Color(0xff033780)
// )
// ),


class DescriptBold extends StatelessWidget {
  int? sizedboxwidth;
  String description;
  String subject;
  DescriptBold({Key? key,
    required BuildContext context,
    required this.subject,
    required this.description,
    this.sizedboxwidth = 8,
  }) : super(key: key);
  @override
  Widget build(context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text(
                    '${subject}',
                    style: TextStyle(
                      color: Color(0xff434849),
                    ),
                  )
              ),
              Expanded(
                  flex: 8,
                  child: Text(
                    '${description}',
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
    );
  }
}



class DescriptLight extends StatelessWidget {
  String subject;
  String description;
  DescriptLight({Key? key,
    required this.subject,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  '$subject',
                  style: TextStyle(
                    color: Color(0xff434849),
                  ),
                )
            ),
            Expanded(
                flex: 8,
                child: Text(
                  '$description',
                  style: TextStyle(
                      color: Color(0xff999999)
                  ),
                )),
          ],
        ),
        SizedBox(height: 8,),
      ],
    );
  }
}



class HeadText extends StatelessWidget {
  var headText;
  HeadText({Key? key,
    required this.headText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$headText',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18
          ),
        ),

        SizedBox(height: 15,),

      ],
    );
  }
}
