import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http ;
class OctResultWebservices {
  String ?  result = '444444' ;
  late List<int> file;

  Future<Object> makeRequest(List<int> selectedFile) async {
    file = selectedFile;
    var url = Uri.parse(
        "http://127.0.0.1:8000/api/UploadImage");

    Map<String, String> headers = {
      "Accept": "application/json",
    };
    try{
      var request = http.MultipartRequest("POST", url);
      request.headers.addAll(headers);
      request.files.add(http.MultipartFile.fromBytes('image', selectedFile,
          filename: "test.png"));
      var response = await http.Response.fromStream(await request.send());
      if (kDebugMode) {
        print("test");
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Uploaded!");
          print("****************!");
          print(response.body);
          result = response.body;
        }
      }


      // showDialog(
      //     builder: (context) => new AlertDialog(
      //       title: new Text("Details"),
      //       //content: new Text("Hello World"),
      //       content: new SingleChildScrollView(
      //         child: new ListBody(
      //           children: <Widget>[
      //             new Text("Upload successfull"),
      //           ],
      //         ),
      //       ),
      //       actions: <Widget>[
      //         TextButton(
      //           child: new Text('Aceptar'),
      //           onPressed: () {
      //             Navigator.pushAndRemoveUntil(
      //               context,
      //               MaterialPageRoute(builder: (context) => UploadImageScreen()),
      //                   (Route<dynamic> route) => false,
      //             );
      //           },
      //         ),
      //       ],
      //     ), barrierDismissible: false,
      //     context: context);
      return response.body;
    }
    catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }


}