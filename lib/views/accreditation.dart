// To parse this JSON data, do
//
//     final accreditation = accreditationFromJson(jsonString);

import 'dart:convert';

Accreditation accreditationFromJson(String str) =>
    Accreditation.fromJson(json.decode(str));

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
    required this.aperScore,
    required this.phoneNumber,
    required this.cadreId,
    required this.presentRankId,
    required this.nextPromotionRankId,
    required this.mdaId,
    required this.candidateRemark,
    required this.stateOfOrigin,
    required this.ippisNo,
    required this.dateOfBirth,
    required this.firstAppointment,
    required this.firstAppointmentUrl,
    required this.confirmationAppointment,
    this.confirmationAppointmentUrl,
    this.letterOfConversionUrl,
    this.eligibilityApointmentLetterUrl,
    required this.presentAppointment,
    this.presentAppointmentUrl,
    this.regularizationAppointmentUrl,
    this.hrmSignatureUrl,
    required this.signatureUrl,
    required this.passportUrl,
    required this.lastYearOfPromotion,
    required this.yearOfPromotion,
    this.promotionLetter1Url,
    this.promotionLetter2Url,
    this.promotionLetter3Url,
    required this.hrmRemark,
    required this.hrmComment,
    required this.statusId,
    required this.mda,
    required this.mdaAdmin,
    required this.presentRank,
    required this.nextPromotionRank,
    required this.cadre,
    required this.checklist,
    required this.comment,
    required this.aperScores,
    required this.qualifications,
    required this.professionalCertificateRequired,
    required this.cadreConverted,
    required this.appointmentLetterEligibility,
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.passwordChanged,
    required this.createdAt,
    required this.updatedAt,
  });

  int candidateId;
  int userId;
  String examNo;
  String serialNo;
  String qrCodeUrl;
  double aperScore;
  String phoneNumber;
  int cadreId;
  int presentRankId;
  int nextPromotionRankId;
  int mdaId;
  String candidateRemark;
  String stateOfOrigin;
  String ippisNo;
  DateTime dateOfBirth;
  DateTime firstAppointment;
  dynamic firstAppointmentUrl;
  DateTime confirmationAppointment;
  dynamic confirmationAppointmentUrl;
  dynamic letterOfConversionUrl;
  dynamic eligibilityApointmentLetterUrl;
  DateTime presentAppointment;
  dynamic presentAppointmentUrl;
  dynamic regularizationAppointmentUrl;
  dynamic hrmSignatureUrl;
  String signatureUrl;
  String passportUrl;
  DateTime lastYearOfPromotion;
  DateTime yearOfPromotion;
  dynamic promotionLetter1Url;
  dynamic promotionLetter2Url;
  dynamic promotionLetter3Url;
  String hrmRemark;
  String hrmComment;
  int statusId;
  Mda mda;
  MdaAdmin mdaAdmin;
  Rank presentRank;
  Rank nextPromotionRank;
  Cadre cadre;
  Checklist checklist;
  List<dynamic> comment;
  List<dynamic> aperScores;
  List<dynamic> qualifications;
  bool professionalCertificateRequired;
  bool cadreConverted;
  bool appointmentLetterEligibility;
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
        aperScore: json["aperScore"].toDouble(),
        phoneNumber: json["phoneNumber"],
        cadreId: json["cadreId"],
        presentRankId: json["presentRankId"],
        nextPromotionRankId: json["nextPromotionRankId"],
        mdaId: json["mdaId"],
        candidateRemark: json["candidateRemark"],
        stateOfOrigin: json["stateOfOrigin"],
        ippisNo: json["ippisNo"],
        dateOfBirth: DateTime.parse(json["dateOFBirth"]),
        firstAppointment: DateTime.parse(json["firstAppointment"]),
        firstAppointmentUrl: json["firstAppointmentURL"],
        confirmationAppointment:
            DateTime.parse(json["confirmationAppointment"]),
        confirmationAppointmentUrl: json["confirmationAppointmentURL"],
        letterOfConversionUrl: json["letterOfConversionURL"],
        eligibilityApointmentLetterUrl: json["eligibilityApointmentLetterURL"],
        presentAppointment: DateTime.parse(json["presentAppointment"]),
        presentAppointmentUrl: json["presentAppointmentURL"],
        regularizationAppointmentUrl: json["regularizationAppointmentURL"],
        hrmSignatureUrl: json["hrmSignatureURL"],
        signatureUrl: json["signatureURL"],
        passportUrl: json["passportURL"],
        lastYearOfPromotion: DateTime.parse(json["lastYearOfPromotion"]),
        yearOfPromotion: DateTime.parse(json["yearOfPromotion"]),
        promotionLetter1Url: json["promotionLetter1URL"],
        promotionLetter2Url: json["promotionLetter2URL"],
        promotionLetter3Url: json["promotionLetter3URL"],
        hrmRemark: json["hrmRemark"],
        hrmComment: json["hrmComment"],
        statusId: json["statusId"],
        mda: Mda.fromJson(json["mda"]),
        mdaAdmin: MdaAdmin.fromJson(json["mdaAdmin"]),
        presentRank: Rank.fromJson(json["presentRank"]),
        nextPromotionRank: Rank.fromJson(json["nextPromotionRank"]),
        cadre: Cadre.fromJson(json["cadre"]),
        checklist: Checklist.fromJson(json["checklist"]),
        comment: List<dynamic>.from(json["comment"].map((x) => x)),
        aperScores: List<dynamic>.from(json["aperScores"].map((x) => x)),
        qualifications:
            List<dynamic>.from(json["qualifications"].map((x) => x)),
        professionalCertificateRequired:
            json["professionalCertificateRequired"],
        cadreConverted: json["cadreConverted"],
        appointmentLetterEligibility: json["appointmentLetterEligibility"],
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
        "aperScore": aperScore,
        "phoneNumber": phoneNumber,
        "cadreId": cadreId,
        "presentRankId": presentRankId,
        "nextPromotionRankId": nextPromotionRankId,
        "mdaId": mdaId,
        "candidateRemark": candidateRemark,
        "stateOfOrigin": stateOfOrigin,
        "ippisNo": ippisNo,
        "dateOFBirth": dateOfBirth.toIso8601String(),
        "firstAppointment": firstAppointment.toIso8601String(),
        "firstAppointmentURL": firstAppointmentUrl,
        "confirmationAppointment": confirmationAppointment.toIso8601String(),
        "confirmationAppointmentURL": confirmationAppointmentUrl,
        "letterOfConversionURL": letterOfConversionUrl,
        "eligibilityApointmentLetterURL": eligibilityApointmentLetterUrl,
        "presentAppointment": presentAppointment.toIso8601String(),
        "presentAppointmentURL": presentAppointmentUrl,
        "regularizationAppointmentURL": regularizationAppointmentUrl,
        "hrmSignatureURL": hrmSignatureUrl,
        "signatureURL": signatureUrl,
        "passportURL": passportUrl,
        "lastYearOfPromotion": lastYearOfPromotion.toIso8601String(),
        "yearOfPromotion": yearOfPromotion.toIso8601String(),
        "promotionLetter1URL": promotionLetter1Url,
        "promotionLetter2URL": promotionLetter2Url,
        "promotionLetter3URL": promotionLetter3Url,
        "hrmRemark": hrmRemark,
        "hrmComment": hrmComment,
        "statusId": statusId,
        "mda": mda.toJson(),
        "mdaAdmin": mdaAdmin.toJson(),
        "presentRank": presentRank.toJson(),
        "nextPromotionRank": nextPromotionRank.toJson(),
        "cadre": cadre.toJson(),
        "checklist": checklist.toJson(),
        "comment": List<dynamic>.from(comment.map((x) => x)),
        "aperScores": List<dynamic>.from(aperScores.map((x) => x)),
        "qualifications": List<dynamic>.from(qualifications.map((x) => x)),
        "professionalCertificateRequired": professionalCertificateRequired,
        "cadreConverted": cadreConverted,
        "appointmentLetterEligibility": appointmentLetterEligibility,
        "emailAddress": emailAddress,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "passwordChanged": passwordChanged,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Cadre {
  Cadre({
    required this.cadreId,
    required this.cadreName,
    required this.cadreAcronym,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.modifiedBy,
    this.createdByUser,
    this.modifiedByUser,
  });

  int cadreId;
  String cadreName;
  String cadreAcronym;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int modifiedBy;
  dynamic createdByUser;
  dynamic modifiedByUser;

  factory Cadre.fromJson(Map<String, dynamic> json) => Cadre(
        cadreId: json["cadreId"],
        cadreName: json["cadreName"],
        cadreAcronym: json["cadreAcronym"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        createdByUser: json["createdByUser"],
        modifiedByUser: json["modifiedByUser"],
      );

  Map<String, dynamic> toJson() => {
        "cadreId": cadreId,
        "cadreName": cadreName,
        "cadreAcronym": cadreAcronym,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "createdByUser": createdByUser,
        "modifiedByUser": modifiedByUser,
      };
}

class Checklist {
  Checklist({
    required this.checklistId,
    required this.academicCertificate,
    required this.professionalCertificates,
    required this.letterOfFirstAppointment,
    required this.confirmationLetter,
    required this.letterOfLastAppointment,
    required this.letterOfConversion,
    required this.pendingDisciplinaryAction,
    required this.eligibleForPromotion,
    required this.professionalCertificateRequired,
    required this.appointmentLetterEligibility,
    required this.createdAt,
    required this.updatedAt,
  });

  int checklistId;
  bool academicCertificate;
  bool professionalCertificates;
  bool letterOfFirstAppointment;
  bool confirmationLetter;
  bool letterOfLastAppointment;
  bool letterOfConversion;
  bool pendingDisciplinaryAction;
  bool eligibleForPromotion;
  bool professionalCertificateRequired;
  bool appointmentLetterEligibility;
  DateTime createdAt;
  DateTime updatedAt;

  factory Checklist.fromJson(Map<String, dynamic> json) => Checklist(
        checklistId: json["checklistId"],
        academicCertificate: json["academicCertificate"],
        professionalCertificates: json["professionalCertificates"],
        letterOfFirstAppointment: json["letterOfFirstAppointment"],
        confirmationLetter: json["confirmationLetter"],
        letterOfLastAppointment: json["letterOfLastAppointment"],
        letterOfConversion: json["letterOfConversion"],
        pendingDisciplinaryAction: json["pendingDisciplinaryAction"],
        eligibleForPromotion: json["eligibleForPromotion"],
        professionalCertificateRequired:
            json["professionalCertificateRequired"],
        appointmentLetterEligibility: json["appointmentLetterEligibility"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "checklistId": checklistId,
        "academicCertificate": academicCertificate,
        "professionalCertificates": professionalCertificates,
        "letterOfFirstAppointment": letterOfFirstAppointment,
        "confirmationLetter": confirmationLetter,
        "letterOfLastAppointment": letterOfLastAppointment,
        "letterOfConversion": letterOfConversion,
        "pendingDisciplinaryAction": pendingDisciplinaryAction,
        "eligibleForPromotion": eligibleForPromotion,
        "professionalCertificateRequired": professionalCertificateRequired,
        "appointmentLetterEligibility": appointmentLetterEligibility,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Mda {
  Mda({
    required this.mdaId,
    required this.mdaName,
    required this.mdaAcronym,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.modifiedBy,
    this.createdByUser,
    this.modifiedByUser,
  });

  int mdaId;
  String mdaName;
  String mdaAcronym;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  int modifiedBy;
  dynamic createdByUser;
  dynamic modifiedByUser;

  factory Mda.fromJson(Map<String, dynamic> json) => Mda(
        mdaId: json["mdaId"],
        mdaName: json["mdaName"],
        mdaAcronym: json["mdaAcronym"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        createdByUser: json["createdByUser"],
        modifiedByUser: json["modifiedByUser"],
      );

  Map<String, dynamic> toJson() => {
        "mdaId": mdaId,
        "mdaName": mdaName,
        "mdaAcronym": mdaAcronym,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "createdByUser": createdByUser,
        "modifiedByUser": modifiedByUser,
      };
}

class MdaAdmin {
  MdaAdmin({
    required this.mdaAdminId,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.emailAddress,
    this.hrmSignatureUrl,
    this.department,
    required this.mdaId,
    required this.mda,
    required this.cadreId,
    required this.rankId,
    this.phoneNumber,
    required this.createdBy,
    required this.modifiedBy,
    this.createdByUser,
    this.modifiedByUser,
    this.rank,
    this.cadre,
    required this.passwordChanged,
    required this.createdAt,
    required this.updatedAt,
  });

  int mdaAdminId;
  String firstName;
  String lastName;
  String middleName;
  String emailAddress;
  dynamic hrmSignatureUrl;
  dynamic department;
  int mdaId;
  Mda mda;
  int cadreId;
  int rankId;
  dynamic phoneNumber;
  int createdBy;
  int modifiedBy;
  dynamic createdByUser;
  dynamic modifiedByUser;
  dynamic rank;
  dynamic cadre;
  bool passwordChanged;
  DateTime createdAt;
  DateTime updatedAt;

  factory MdaAdmin.fromJson(Map<String, dynamic> json) => MdaAdmin(
        mdaAdminId: json["mdaAdminId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        emailAddress: json["emailAddress"],
        hrmSignatureUrl: json["hrmSignatureURL"],
        department: json["department"],
        mdaId: json["mdaId"],
        mda: Mda.fromJson(json["mda"]),
        cadreId: json["cadreId"],
        rankId: json["rankId"],
        phoneNumber: json["phoneNumber"],
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        createdByUser: json["createdByUser"],
        modifiedByUser: json["modifiedByUser"],
        rank: json["rank"],
        cadre: json["cadre"],
        passwordChanged: json["passwordChanged"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "mdaAdminId": mdaAdminId,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "emailAddress": emailAddress,
        "hrmSignatureURL": hrmSignatureUrl,
        "department": department,
        "mdaId": mdaId,
        "mda": mda.toJson(),
        "cadreId": cadreId,
        "rankId": rankId,
        "phoneNumber": phoneNumber,
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "createdByUser": createdByUser,
        "modifiedByUser": modifiedByUser,
        "rank": rank,
        "cadre": cadre,
        "passwordChanged": passwordChanged,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Rank {
  Rank({
    required this.rankId,
    required this.rankName,
    required this.rankAcronym,
    required this.minimumPromotionYear,
    required this.createdAt,
    required this.updatedAt,
    required this.priority,
    required this.createdBy,
    required this.modifiedBy,
    this.createdByUser,
    this.modifiedByUser,
  });

  int rankId;
  String rankName;
  String rankAcronym;
  int minimumPromotionYear;
  DateTime createdAt;
  DateTime updatedAt;
  int priority;
  int createdBy;
  int modifiedBy;
  dynamic createdByUser;
  dynamic modifiedByUser;

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        rankId: json["rankId"],
        rankName: json["rankName"],
        rankAcronym: json["rankAcronym"],
        minimumPromotionYear: json["minimumPromotionYear"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        priority: json["priority"],
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        createdByUser: json["createdByUser"],
        modifiedByUser: json["modifiedByUser"],
      );

  Map<String, dynamic> toJson() => {
        "rankId": rankId,
        "rankName": rankName,
        "rankAcronym": rankAcronym,
        "minimumPromotionYear": minimumPromotionYear,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "priority": priority,
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "createdByUser": createdByUser,
        "modifiedByUser": modifiedByUser,
      };
}
