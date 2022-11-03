class UserDataModel {
  int? statusCode;
  String? statusMessage;
  ObjectValue? objectValue;

  UserDataModel({this.statusCode, this.statusMessage, this.objectValue});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    objectValue = json['objectValue'] != null
        ? new ObjectValue.fromJson(json['objectValue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    if (this.objectValue != null) {
      data['objectValue'] = this.objectValue!.toJson();
    }
    return data;
  }
}

class ObjectValue {
  int? candidateId;
  String? qrCode;

  String? firstName;
  String? lastName;
  String? candidatePhoto;
  String? controlNo;
  String? examNo;

  ObjectValue(
      {this.candidateId,
      this.qrCode,
      this.firstName,
      this.lastName,
      this.candidatePhoto,
      this.controlNo,
      this.examNo});

  ObjectValue.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidateId'] ?? "";
    qrCode = json['qrCode'] ?? "";

    firstName = json['firstName'] ?? "";
    lastName = json['lastName'] ?? "";
    candidatePhoto = json['candidatePhoto'] ?? "";
    controlNo = json['controlNo'] ?? "";
    examNo = json['examNo'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['candidateId'] = this.candidateId;
    data['qrCode'] = this.qrCode;

    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['candidatePhoto'] = this.candidatePhoto;
    data['controlNo'] = this.controlNo;
    data['examNo'] = this.examNo;
    return data;
  }
}
