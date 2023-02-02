// // // To parse this JSON data, do
// // //
// // //     final result = resultFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // Result resultFromJson(String str) => Result.fromJson(json.decode(str));
// //
// // String resultToJson(Result data) => json.encode(data.toJson());
// //
// // class Result {
// //   Result({
// //     required this.status,
// //     required this.errNum,
// //     required this.msg,
// //     required this.response,
// //   });
// //
// //   bool status;
// //   String errNum;
// //   String msg;
// //   Response response;
// //
// //   factory Result.fromJson(Map<String, dynamic> json) => Result(
// //     status: json["status"],
// //     errNum: json["errNum"],
// //     msg: json["msg"],
// //     response: Response.fromJson(json["response"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "status": status,
// //     "errNum": errNum,
// //     "msg": msg,
// //     "response": response.toJson(),
// //   };
// // }
// //
// // class Response {
// //   Response({
// //     required this.responseClass,
// //     required this.confidence,
// //   });
// //
// //   String responseClass;
// //   String confidence;
// //
// //   factory Response.fromJson(Map<String, dynamic> json) => Response(
// //     responseClass: json["class"],
// //     confidence: json["confidence"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "class": responseClass,
// //     "confidence": confidence,
// //   };
// // }
// class Result {
//   Result({
//     required this.status,
//     required this.msg,
//     required this.response,
//   });
//   late final bool status;
//   late final String msg;
//   late final Response response;
//
//   Result.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     response = Response.fromJson(json['response']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['response'] = response.toJson();
//     return _data;
//   }
// }
//
// class Response {
//   Response({
//   required this.classes,
//   required this.confidence,
// });
// late final String class;
// late final String confidence;
//
// Response.fromJson(Map<String, dynamic> json){
// class = json['class'];
// confidence = json['confidence'];
// }
//
// Map<String, dynamic> toJson() {
// final _data = <String, dynamic>{};
// _data['class'] = class;
// _data['confidence'] = confidence;
// return _data;
// }
// }