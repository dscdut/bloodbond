// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donor.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonorModel _$DonorModelFromJson(Map<String, dynamic> json) => DonorModel(
      donorId: json['donorId'] as String,
      name: json['name'] as String,
      bloodType: $enumDecode(_$BloodTypeEnumMap, json['bloodType']),
      description: json['description'] as String,
      phone: json['phone'] as String,
      location: Coordinate.fromJson(json['location'] as Map<String, dynamic>),
    );

const _$BloodTypeEnumMap = {
  BloodType.aPlus: 'aPlus',
  BloodType.aMinus: 'aMinus',
  BloodType.bPlus: 'bPlus',
  BloodType.bMinus: 'bMinus',
  BloodType.oPlus: 'oPlus',
  BloodType.oMinus: 'oMinus',
  BloodType.abPlus: 'abPlus',
  BloodType.abMinus: 'abMinus',
};
