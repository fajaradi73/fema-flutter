import 'package:fema_flutter/generated/json/base/json_convert_content.dart';
import 'package:fema_flutter/screen/profile/model/profile_model_entity.dart';

ProfileModelEntity $ProfileModelEntityFromJson(Map<String, dynamic> json) {
	final ProfileModelEntity profileModelEntity = ProfileModelEntity();
	final String? photoFilePath = jsonConvert.convert<String>(json['photoFilePath']);
	if (photoFilePath != null) {
		profileModelEntity.photoFilePath = photoFilePath;
	}
	final String? personId = jsonConvert.convert<String>(json['personId']);
	if (personId != null) {
		profileModelEntity.personId = personId;
	}
	final String? companyId = jsonConvert.convert<String>(json['companyId']);
	if (companyId != null) {
		profileModelEntity.companyId = companyId;
	}
	final String? companyName = jsonConvert.convert<String>(json['companyName']);
	if (companyName != null) {
		profileModelEntity.companyName = companyName;
	}
	final String? jobCode = jsonConvert.convert<String>(json['jobCode']);
	if (jobCode != null) {
		profileModelEntity.jobCode = jobCode;
	}
	final String? jobName = jsonConvert.convert<String>(json['jobName']);
	if (jobName != null) {
		profileModelEntity.jobName = jobName;
	}
	final String? jobUUID = jsonConvert.convert<String>(json['jobUUID']);
	if (jobUUID != null) {
		profileModelEntity.jobUUID = jobUUID;
	}
	final String? personUUID = jsonConvert.convert<String>(json['personUUID']);
	if (personUUID != null) {
		profileModelEntity.personUUID = personUUID;
	}
	final String? organizationUUID = jsonConvert.convert<String>(json['organizationUUID']);
	if (organizationUUID != null) {
		profileModelEntity.organizationUUID = organizationUUID;
	}
	final bool? isHeadOffice = jsonConvert.convert<bool>(json['isHeadOffice']);
	if (isHeadOffice != null) {
		profileModelEntity.isHeadOffice = isHeadOffice;
	}
	final String? npk = jsonConvert.convert<String>(json['npk']);
	if (npk != null) {
		profileModelEntity.npk = npk;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		profileModelEntity.fullName = fullName;
	}
	final String? genderCode = jsonConvert.convert<String>(json['genderCode']);
	if (genderCode != null) {
		profileModelEntity.genderCode = genderCode;
	}
	final String? birthPlace = jsonConvert.convert<String>(json['birthPlace']);
	if (birthPlace != null) {
		profileModelEntity.birthPlace = birthPlace;
	}
	final String? glCode = jsonConvert.convert<String>(json['glCode']);
	if (glCode != null) {
		profileModelEntity.glCode = glCode;
	}
	final String? birthDate = jsonConvert.convert<String>(json['birthDate']);
	if (birthDate != null) {
		profileModelEntity.birthDate = birthDate;
	}
	final String? maritalStatus = jsonConvert.convert<String>(json['maritalStatus']);
	if (maritalStatus != null) {
		profileModelEntity.maritalStatus = maritalStatus;
	}
	final String? ptkpStatus = jsonConvert.convert<String>(json['ptkpStatus']);
	if (ptkpStatus != null) {
		profileModelEntity.ptkpStatus = ptkpStatus;
	}
	final String? mobilePhone = jsonConvert.convert<String>(json['mobilePhone']);
	if (mobilePhone != null) {
		profileModelEntity.mobilePhone = mobilePhone;
	}
	final String? assignment = jsonConvert.convert<String>(json['assignment']);
	if (assignment != null) {
		profileModelEntity.assignment = assignment;
	}
	final String? ktp = jsonConvert.convert<String>(json['ktp']);
	if (ktp != null) {
		profileModelEntity.ktp = ktp;
	}
	final String? npwp = jsonConvert.convert<String>(json['npwp']);
	if (npwp != null) {
		profileModelEntity.npwp = npwp;
	}
	final String? organizationId = jsonConvert.convert<String>(json['organizationId']);
	if (organizationId != null) {
		profileModelEntity.organizationId = organizationId;
	}
	final String? organization = jsonConvert.convert<String>(json['organization']);
	if (organization != null) {
		profileModelEntity.organization = organization;
	}
	final String? organizationCode = jsonConvert.convert<String>(json['organizationCode']);
	if (organizationCode != null) {
		profileModelEntity.organizationCode = organizationCode;
	}
	final String? branchId = jsonConvert.convert<String>(json['branchId']);
	if (branchId != null) {
		profileModelEntity.branchId = branchId;
	}
	final String? branchCode = jsonConvert.convert<String>(json['branchCode']);
	if (branchCode != null) {
		profileModelEntity.branchCode = branchCode;
	}
	final String? branchName = jsonConvert.convert<String>(json['branchName']);
	if (branchName != null) {
		profileModelEntity.branchName = branchName;
	}
	final String? organizationLevelCode = jsonConvert.convert<String>(json['organizationLevelCode']);
	if (organizationLevelCode != null) {
		profileModelEntity.organizationLevelCode = organizationLevelCode;
	}
	final String? birthDateStr = jsonConvert.convert<String>(json['birthDateStr']);
	if (birthDateStr != null) {
		profileModelEntity.birthDateStr = birthDateStr;
	}
	final String? lvl1OrgDept = jsonConvert.convert<String>(json['lvl1OrgDept']);
	if (lvl1OrgDept != null) {
		profileModelEntity.lvl1OrgDept = lvl1OrgDept;
	}
	final String? lvl1LevelCode = jsonConvert.convert<String>(json['lvl1LevelCode']);
	if (lvl1LevelCode != null) {
		profileModelEntity.lvl1LevelCode = lvl1LevelCode;
	}
	return profileModelEntity;
}

Map<String, dynamic> $ProfileModelEntityToJson(ProfileModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['photoFilePath'] = entity.photoFilePath;
	data['personId'] = entity.personId;
	data['companyId'] = entity.companyId;
	data['companyName'] = entity.companyName;
	data['jobCode'] = entity.jobCode;
	data['jobName'] = entity.jobName;
	data['jobUUID'] = entity.jobUUID;
	data['personUUID'] = entity.personUUID;
	data['organizationUUID'] = entity.organizationUUID;
	data['isHeadOffice'] = entity.isHeadOffice;
	data['npk'] = entity.npk;
	data['fullName'] = entity.fullName;
	data['genderCode'] = entity.genderCode;
	data['birthPlace'] = entity.birthPlace;
	data['glCode'] = entity.glCode;
	data['birthDate'] = entity.birthDate;
	data['maritalStatus'] = entity.maritalStatus;
	data['ptkpStatus'] = entity.ptkpStatus;
	data['mobilePhone'] = entity.mobilePhone;
	data['assignment'] = entity.assignment;
	data['ktp'] = entity.ktp;
	data['npwp'] = entity.npwp;
	data['organizationId'] = entity.organizationId;
	data['organization'] = entity.organization;
	data['organizationCode'] = entity.organizationCode;
	data['branchId'] = entity.branchId;
	data['branchCode'] = entity.branchCode;
	data['branchName'] = entity.branchName;
	data['organizationLevelCode'] = entity.organizationLevelCode;
	data['birthDateStr'] = entity.birthDateStr;
	data['lvl1OrgDept'] = entity.lvl1OrgDept;
	data['lvl1LevelCode'] = entity.lvl1LevelCode;
	return data;
}