import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../const/font_styles.dart';
import '../../const/size.dart';

class Button extends StatefulWidget {
  final String text;
 final  Function ? onTap;

  const Button({super.key, required this.text, this.onTap});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap!(),
      child: Container(
        height: height(context, 7),
        width: width(context, 7),
        margin: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: darkPurple,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(
            //   color: lightGray,
            // ),
            boxShadow: [
              BoxShadow(
                color: white3,
                blurRadius: .5,
                spreadRadius: 2,
              )
            ]),
        child: Center(
            child: Text(
          widget.text,
          style: submitButtonStyle,
        )),
      ),
    );
  }
}
