// To parse this JSON data, do
//
//     final octModel = octModelFromJson(jsonString);

import 'dart:convert';

OctModel octModelFromJson(String str) => OctModel.fromJson(json.decode(str));

String octModelToJson(OctModel data) => json.encode(data.toJson());

class OctModel {
  OctModel({
    required this.status,
    required this.msg,
    required this.response,
  });

  bool status;
  String msg;
  Response response;

  factory OctModel.fromJson(Map<String, dynamic> json) => OctModel(
        status: json["status"],
        msg: json["msg"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "response": response.toJson(),
      };
}

class Response {
  Response({
    required this.responseClass,
    required  this.confidence,
  });

  String responseClass;
  String confidence;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        responseClass: json["class"],
        confidence: json["confidence"],
      );

  Map<String, dynamic> toJson() => {
        "class": responseClass,
        "confidence": confidence,
      };
}
