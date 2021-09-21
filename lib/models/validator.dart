// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Validator dashboardFromJson(String str) => Validator.fromJson(json.decode(str));

String dashboardToJson(Validator data) => json.encode(data.toJson());

class Validator {
  Validator({
    required this.statusCode,
    required this.statusMessage,
    required this.objectValue,
  });

  int statusCode;
  String statusMessage;
  ObjectValue objectValue;

  factory Validator.fromJson(Map<String, dynamic> json) => Validator(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
        objectValue: ObjectValue.fromJson(json["objectValue"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
        "objectValue": objectValue.toJson(),
      };
}

class ObjectValue {
  ObjectValue({
    required this.firstName,
    required this.lastName,
    required this.applicantPassportUrl,
    required this.qrCodeUrl,
    required this.examNo,
    required this.serialNo,
    required this.controlNo,
  });

  String firstName;

  String lastName;

  String applicantPassportUrl;
  String qrCodeUrl;
  String examNo;
  String serialNo;
  String controlNo;

  factory ObjectValue.fromJson(Map<String, dynamic> json) => ObjectValue(
        firstName: json["firstName"],
        lastName: json["lastName"],
        applicantPassportUrl: json["applicantPassportURL"],
        qrCodeUrl: json["qrCodeURL"],
        examNo: json["examNo"],
        serialNo: json["serialNo"],
        controlNo: json["controlNo"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "applicantPassportURL": applicantPassportUrl,
        "qrCodeURL": qrCodeUrl,
        "examNo": examNo,
        "serialNo": serialNo,
        "controlNo": controlNo,
      };
}
