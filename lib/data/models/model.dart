// ToDo:
class Result {
  bool? status;
  String? msg;
  Response? response;

  Result({this.status, this.msg, this.response});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  String? classes;
  String? confidence;

  Response({this.classes, this.confidence});

  Response.fromJson(Map<String, dynamic> json) {
    classes = json['class'] ?? '';
    confidence = json['confidence'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class'] = classes;
    data['confidence'] = confidence;
    return data;
  }
}