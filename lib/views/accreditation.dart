// To parse this JSON data, do
//
//     final accreditation = accreditationFromJson(jsonString);

import 'dart:convert';

Accreditation accreditationFromJson(String str) => Accreditation.fromJson(json.decode(str));

String accreditationToJson(Accreditation data) => json.encode(data.toJson());

class Accreditation {
  Accreditation({
    required this.error,
    required this.response,
    required this.message,
  });

  bool error;
  Response response;
  String message;

  factory Accreditation.fromJson(Map<String, dynamic> json) => Accreditation(
    error: json["error"],
    response: Response.fromJson(json["response"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "response": response.toJson(),
    "message": message,
  };
}

class Response {
  Response({
    required this.candidateId,
    required this.userId,
    required this.examNo,
    required this.serialNo,
    required this.qrCodeUrl,
    required this.signatureUrl,
    required this.passportUrl,
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required  this.passwordChanged,
    required this.createdAt,
    required this.updatedAt,
  });

  int candidateId;
  int userId;
  String examNo;
  String serialNo;
  String qrCodeUrl;
  String signatureUrl;
  String passportUrl;
  String emailAddress;
  String firstName;
  String lastName;
  String middleName;
  bool passwordChanged;
  DateTime createdAt;
  DateTime updatedAt;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    candidateId: json["candidateId"],
    userId: json["userId"],
    examNo: json["examNo"],
    serialNo: json["serialNo"],
    qrCodeUrl: json["qrCodeURL"],
    signatureUrl: json["signatureURL"],
    passportUrl: json["passportURL"],
    emailAddress: json["emailAddress"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    middleName: json["middleName"],
    passwordChanged: json["passwordChanged"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "candidateId": candidateId,
    "userId": userId,
    "examNo": examNo,
    "serialNo": serialNo,
    "qrCodeURL": qrCodeUrl,
    "signatureURL": signatureUrl,
    "passportURL": passportUrl,
    "emailAddress": emailAddress,
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "passwordChanged": passwordChanged,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
