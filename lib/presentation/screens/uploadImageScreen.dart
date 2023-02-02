// ignore_for_file: file_names

import 'dart:convert';
import 'dart:html' as html;

import 'package:deep_n_eye/data/models/oct_model.dart';
import 'package:deep_n_eye/data/repository/oct_result_repository.dart';
import 'package:deep_n_eye/data/web_services/oct_web_services.dart';
import 'package:deep_n_eye/presentation/screens/resultScreen.dart';
import 'package:deep_n_eye/presentation/widgets/submit_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../const/color.dart';
import '../../const/font_styles.dart';
import '../../const/size.dart';
import '../../data/models/model.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}
Result ? model;

class _UploadImageScreenState extends State<UploadImageScreen> {
  late List<int> _selectedFile;
  late Uint8List _bytesData;
  late OctResultWebservices octResultWebservices;
  String? result;
  String? message;

  startWebFilePicker() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result.toString());
      });
      reader.readAsDataUrl(file);
    });
  }

  void _handleResult(Object result) {
    setState(() {
      _bytesData =
          const Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;
    });
  }

  makeRequest() async {
    var url = Uri.parse("http://127.0.0.1:8000/api/UploadImage");

    Map<String, String> headers = {
      "Accept": "application/json",
    };
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile.fromBytes('image', _selectedFile,
        filename: "test.png"));
    var response = await http.Response.fromStream(await request.send());
    if (kDebugMode) {
      print("test");
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      setState(() {
        message = ' image upload with success';
        print(response.body);
      });
      // ToDo : المشكلة هنا في ال model
       return Result.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

      ;
    } else {
      setState(() {
        message = ' image not upload';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              startWebFilePicker();
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
                await makeRequest();

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const ResultScreen()));
              })
        ],
      ),
    );
  }
}
