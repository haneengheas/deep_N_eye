// ignore_for_file: file_names

import 'package:deep_n_eye/const/font_styles.dart';
import 'package:deep_n_eye/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import '../../const/size.dart';
import '../../data/models/model.dart';

class ResultScreen extends StatefulWidget {
  final Result? result;

  const ResultScreen({Key? key, this.result}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height(context, 10),
                  ),
                  Text(
                    'Results',
                    style: title3,
                  ),
                  Container(
                    height: height(context, 4),
                    width: width(context, 2.5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: decoration,
                    child: Text(
                      '${widget.result!.response!.classes}',
                      style: title4,
                    ),
                  ),
                  SizedBox(
                    height: height(context, 15),
                  ),
                  Text(
                    'Notes',
                    style: title3,
                  ),
                  Container(
                      height: height(context, 4),
                      width: width(context, 2.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: decoration,
                      child: TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type your notes ',
                          hintStyle: hintText,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              width: width(context, 10),
            ),
            Center(
              child: Container(
                height: height(context, 1.5),
                width: width(context, 2.5),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: decoration,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/model.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            )
          ],
        ),
        SubmitButton(
          text: 'Done',
          onTap: () {
            print(widget.result!.response!.confidence);
          },
        )
      ],
    ));
  }
}
