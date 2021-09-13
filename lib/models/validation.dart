import 'package:json_annotation/json_annotation.dart';

part 'validation.g.dart';

@JsonSerializable()
class Validation {
  final String firstName;
  final String lastName;
  final String middleName;
  final String applicantPassportURL;
  final String qrCodeURL;
  final String serialNo;
  final String controlNo;

  Validation({
    required this.controlNo,
    required this.serialNo,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.applicantPassportURL,
    required this.qrCodeURL,
  });
  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);
  @override
  String toString() {
    return 'Validation{firstName: $firstName, lastName: $lastName, '
        'middleName: $middleName,'
        ' applicantPassportURL: $applicantPassportURL, qrCodeURL: $qrCodeURL,serialNo: $serialNo, controlNo: $controlNo }';
  }
}
