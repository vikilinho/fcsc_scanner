// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  Dashboard({
    required this.statusCode,
    required this.statusMessage,
    required this.objectValue,
  });

  int statusCode;
  String statusMessage;
  ObjectValue objectValue;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
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
    required this.title,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.emailAddress,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.maritalStatus,
    required this.stateOfOrigin,
    required this.lga,
    required this.town,
    required this.geoPoliticalZone,
    required this.country,
    required this.state,
    required this.streetName,
    required this.postalCode,
    required this.phoneNumber,
    required this.alternatePhoneNumber,
    required this.applicantIdType,
    required this.applicantIdurl,
    required this.applicantPassportUrl,
    required this.applicantNyscurl,
    required this.qrCodeUrl,
    required this.step,
    required this.createdAt,
    required this.applicantType,
    required this.yearsOfExperience,
    required this.examNo,
    required this.serialNo,
    required this.controlNo,
    required this.stage,
    required this.nyscStatus,
    required this.candidateTypeId,
    required this.shortlistedToTakeQuiz,
    required this.candidateQuiz,

    required this.certifications,

    required this.skills,
  });

  int candidateId;
  String title;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String emailAddress;
  DateTime dateOfBirth;
  String placeOfBirth;
  String maritalStatus;
  String stateOfOrigin;
  String lga;
  String town;
  String geoPoliticalZone;
  String country;
  String state;
  String streetName;
  String postalCode;
  String phoneNumber;
  String alternatePhoneNumber;
  String applicantIdType;
  String applicantIdurl;
  String applicantPassportUrl;
  String applicantNyscurl;
  String qrCodeUrl;
  int step;
  DateTime createdAt;
  int applicantType;
  dynamic yearsOfExperience;
  dynamic examNo;
  String serialNo;
  String controlNo;
  int stage;
  String nyscStatus;
  int candidateTypeId;
  int shortlistedToTakeQuiz;
  List<dynamic> candidateQuiz;

  List<Certification> certifications;

  List<dynamic> skills;

  factory ObjectValue.fromJson(Map<String, dynamic> json) => ObjectValue(
        candidateId: json["candidateId"],
        title: json["title"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        gender: json["gender"],
        emailAddress: json["emailAddress"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        placeOfBirth: json["placeOfBirth"],
        maritalStatus: json["maritalStatus"],
        stateOfOrigin: json["stateOfOrigin"],
        lga: json["lga"],
        town: json["town"],
        geoPoliticalZone: json["geoPoliticalZone"],
        country: json["country"],
        state: json["state"],
        streetName: json["streetName"],
        postalCode: json["postalCode"],
        phoneNumber: json["phoneNumber"],
        alternatePhoneNumber: json["alternatePhoneNumber"],
        applicantIdType: json["applicantIDType"],
        applicantIdurl: json["applicantIDURL"],
        applicantPassportUrl: json["applicantPassportURL"],
        applicantNyscurl: json["applicantNYSCURL"],
        qrCodeUrl: json["qrCodeURL"],
        step: json["step"],
        createdAt: DateTime.parse(json["createdAt"]),
        applicantType: json["applicantType"],
        yearsOfExperience: json["yearsOfExperience"],
        examNo: json["examNo"],
        serialNo: json["serialNo"],
        controlNo: json["controlNo"],
        stage: json["stage"],
        nyscStatus: json["nyscStatus"],
        candidateTypeId: json["candidateTypeId"],
        shortlistedToTakeQuiz: json["shortlistedToTakeQuiz"],
        candidateQuiz: List<dynamic>.from(json["candidateQuiz"].map((x) => x)),

        certifications: List<Certification>.from(
            json["certifications"].map((x) => Certification.fromJson(x))),

        skills: List<dynamic>.from(json["skills"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "candidateId": candidateId,
        "title": title,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "gender": gender,
        "emailAddress": emailAddress,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "placeOfBirth": placeOfBirth,
        "maritalStatus": maritalStatus,
        "stateOfOrigin": stateOfOrigin,
        "lga": lga,
        "town": town,
        "geoPoliticalZone": geoPoliticalZone,
        "country": country,
        "state": state,
        "streetName": streetName,
        "postalCode": postalCode,
        "phoneNumber": phoneNumber,
        "alternatePhoneNumber": alternatePhoneNumber,
        "applicantIDType": applicantIdType,
        "applicantIDURL": applicantIdurl,
        "applicantPassportURL": applicantPassportUrl,
        "applicantNYSCURL": applicantNyscurl,
        "qrCodeURL": qrCodeUrl,
        "step": step,
        "createdAt": createdAt.toIso8601String(),
        "applicantType": applicantType,
        "yearsOfExperience": yearsOfExperience,
        "examNo": examNo,
        "serialNo": serialNo,
        "controlNo": controlNo,
        "stage": stage,
        "nyscStatus": nyscStatus,
        "candidateTypeId": candidateTypeId,
        "shortlistedToTakeQuiz": shortlistedToTakeQuiz,
        "candidateQuiz": List<dynamic>.from(candidateQuiz.map((x) => x)),

        "certifications":
            List<dynamic>.from(certifications.map((x) => x.toJson())),

        "skills": List<dynamic>.from(skills.map((x) => x)),
      };
}

class Certification {
  Certification({
    required this.certificationId,
    required this.instituitionName,
    required this.certificationName,
    required this.certificationMonthYear,
    required this.candidateId,
    required this.createdAt,
  });

  int certificationId;
  String instituitionName;
  String certificationName;
  DateTime certificationMonthYear;
  int candidateId;
  DateTime createdAt;

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        certificationId: json["certificationId"],
        instituitionName: json["instituitionName"],
        certificationName: json["certificationName"],
        certificationMonthYear: DateTime.parse(json["certificationMonthYear"]),
        candidateId: json["candidateId"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "certificationId": certificationId,
        "instituitionName": instituitionName,
        "certificationName": certificationName,
        "certificationMonthYear": certificationMonthYear.toIso8601String(),
        "candidateId": candidateId,
        "createdAt": createdAt.toIso8601String(),
      };
}





