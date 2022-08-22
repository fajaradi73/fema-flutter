import 'package:fema_flutter/generated/json/base/json_field.dart';
import 'package:fema_flutter/generated/json/profile_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ProfileModelEntity {

	String? photoFilePath;
	String? personId;
	String? companyId;
	String? companyName;
	String? jobCode;
	String? jobName;
	String? jobUUID;
	String? personUUID;
	String? organizationUUID;
	bool? isHeadOffice;
	String? npk;
	String? fullName;
	String? genderCode;
	String? birthPlace;
	String? glCode;
	String? birthDate;
	String? maritalStatus;
	String? ptkpStatus;
	String? mobilePhone;
	String? assignment;
	String? ktp;
	String? npwp;
	String? organizationId;
	String? organization;
	String? organizationCode;
	String? branchId;
	String? branchCode;
	String? branchName;
	String? organizationLevelCode;
	String? birthDateStr;
	String? lvl1OrgDept;
	String? lvl1LevelCode;
	String? peopleType;
  
  ProfileModelEntity();

  factory ProfileModelEntity.fromJson(Map<String, dynamic> json) => $ProfileModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProfileModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}