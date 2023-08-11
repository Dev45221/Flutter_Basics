import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Round_Button extends StatelessWidget {

  final String text;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;


  Round_Button(
      {
        required this.text,
        this.icon,
        this.bgColor = Colors.yellow,
        this.textStyle,
        this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          callback!();
        },
        style: ElevatedButton.styleFrom(
        primary: bgColor,
          shadowColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            )
          )

    ) ,
        child: icon!=null? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            Text(text, style: textStyle,)
          ],)
            : Text(text, style: textStyle,),
    )
    ;
  }

}
