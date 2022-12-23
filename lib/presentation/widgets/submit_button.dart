import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../const/font_styles.dart';
import '../../const/size.dart';

class SubmitButton extends StatefulWidget {
  final String text;
  final  Function ? onTap;

  const SubmitButton({super.key, required this.text, this.onTap});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap!(),
      child: Container(
        height: height(context, 14),
        width: width(context, 11),
        margin: const EdgeInsets.symmetric(vertical: 25),
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
