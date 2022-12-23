// ignore_for_file: file_names

import 'package:deep_n_eye/const/color.dart';
import 'package:deep_n_eye/presentation/screens/uploadImageScreen.dart';
import 'package:flutter/material.dart';

import '../../const/font_styles.dart';
import '../../const/size.dart';
import '../widgets/button.dart';

class InvestigationsScreen extends StatefulWidget {
  const InvestigationsScreen({Key? key}) : super(key: key);

  @override
  State<InvestigationsScreen> createState() => _InvestigationsScreenState();
}

class _InvestigationsScreenState extends State<InvestigationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: height(context, 8)
          ),
          Center(child: Text('Investigations', style: title,)),
          SizedBox(
              height: height(context, 10)
          ),
          Container(
            height: height(context, 2.3),
            width: width(context, 2),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: white4,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: lightGray,
                ),
                boxShadow: [
                  BoxShadow(
                    color: white3,
                    blurRadius: .5,
                    spreadRadius: 2,


                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    Button(text: 'OCT', onTap: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>  const UploadImageScreen()))),
                    const Button(text: 'FFA'),
                    const Button(text: 'VEP'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Button(text: 'ERG'),
                    Button(text: 'EOG'),
                    Button(text: 'Ultrasound'),
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
