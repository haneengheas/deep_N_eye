import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:deep_n_eye/data/web_services/oct_web_services.dart';
import 'package:deep_n_eye/presentation/widgets/submit_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../const/color.dart';
import '../../const/font_styles.dart';
import '../../const/size.dart';
import '../../data/models/oct_model.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  List<PlatformFile>? _paths;
  OctResult ?  _octResult;

  void pickFiles() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      log('Unsupported operation' + e.toString());
    } catch (e) {
      log(e.toString());
    }
    setState(() {
      if (_paths != null) {
        if (_paths != null) {
          //passing file bytes and file name for API call
          _octResult!.oct(_paths!.first.bytes!, _paths!.first.name);
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height(context, 10)),
          Center(
              child: Text(
            'OCT-Investigation',
            style: title2,
          )),
          SizedBox(height: height(context, 12)),
          InkWell(
            onTap: () async {
              pickFiles();
              print('-----------------');
              print(_paths);
              print(_paths);
            },
            child: Container(
              height: height(context, 2),
              width: width(context, 2.3),
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
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    const AssetImage('assets/upload.png'),
                    size: height(context, 6),
                    color: darkPurple,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Upload',
                    style: title2,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height(context, 12)),
          SubmitButton(
              text: 'Next',
              onTap: () async {
                print(_paths);

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const ResultScreen()));
              })
        ],
      ),
    );
  }
}
