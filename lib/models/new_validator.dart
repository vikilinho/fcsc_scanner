// To parse this JSON data, do
//
//     final weatherAlt = weatherAltFromJson(jsonString);

import 'dart:convert';

NewValidator weatherAltFromJson(String str) =>
    NewValidator.fromJson(json.decode(str));

String weatherAltToJson(NewValidator data) => json.encode(data.toJson());

class NewValidator {
  NewValidator({
    required this.statusCode,
    required this.statusMessage,
    required this.objectValue,
  });

  int statusCode;
  String statusMessage;
  ObjectValue objectValue;

  factory NewValidator.fromJson(Map<String, dynamic> json) => NewValidator(
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
    required this.candidateId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    this.gender,
    required this.dateOfBirth,
    this.courseOfStudy,
    this.city,
    required this.stateId,
    required this.phoneNumber,
    required this.emailAddress,
    this.candidatePictureLink,
    required this.candidateTypeId,
    required this.shortlistedToTakeQuiz,
    required this.picture,
    required this.signature,
    required this.qrCodeUrl,
    required this.batchNo,
    required this.controlNo,
    required this.examNo,
  });

  int candidateId;
  String firstName;
  String middleName;
  String lastName;
  dynamic gender;
  DateTime dateOfBirth;
  dynamic courseOfStudy;
  dynamic city;
  int stateId;
  String phoneNumber;
  String emailAddress;
  dynamic candidatePictureLink;
  int candidateTypeId;
  int shortlistedToTakeQuiz;
  String picture;
  String signature;
  String qrCodeUrl;

  dynamic mdaDetail;

  dynamic cadreDetail;

  dynamic rankDetail;
  String batchNo;
  String controlNo;
  String examNo;

  factory ObjectValue.fromJson(Map<String, dynamic> json) => ObjectValue(
        candidateId: json["candidateId"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        courseOfStudy: json["courseOfStudy"],
        city: json["city"],
        stateId: json["stateId"],
        phoneNumber: json["phoneNumber"],
        emailAddress: json["emailAddress"],
        candidatePictureLink: json["candidatePictureLink"],
        candidateTypeId: json["candidateTypeId"],
        shortlistedToTakeQuiz: json["shortlistedToTakeQuiz"],
        picture: json["picture"],
        signature: json["signature"],
        qrCodeUrl: json["qrCodeURL"],
        batchNo: json["batchNo"],
        controlNo: json["controlNo"],
        examNo: json["examNo"],
      );

  Map<String, dynamic> toJson() => {
        "candidateId": candidateId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "gender": gender,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "courseOfStudy": courseOfStudy,
        "city": city,
        "stateId": stateId,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
        "candidatePictureLink": candidatePictureLink,
        "candidateTypeId": candidateTypeId,
        "shortlistedToTakeQuiz": shortlistedToTakeQuiz,
        "picture": picture,
        "signature": signature,
        "qrCodeURL": qrCodeUrl,
        "mdaDetail": mdaDetail,
        "cadreDetail": cadreDetail,
        "rankDetail": rankDetail,
        "batchNo": batchNo,
        "controlNo": controlNo,
        "examNo": examNo,
      };
}
