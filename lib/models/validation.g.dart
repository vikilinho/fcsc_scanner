// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validation _$ValidationFromJson(Map<String, dynamic> json) {
  return Validation(
    controlNo: json['controlNo'] as String,
    serialNo: json['serialNo'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    middleName: json['middleName'] as String,
    applicantPassportURL: json['applicantPassportURL'] as String,
    qrCodeURL: json['qrCodeURL'] as String,
  );
}

Map<String, dynamic> _$ValidationToJson(Validation instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'applicantPassportURL': instance.applicantPassportURL,
      'qrCodeURL': instance.qrCodeURL,
      'serialNo': instance.serialNo,
      'controlNo': instance.controlNo,
    };
