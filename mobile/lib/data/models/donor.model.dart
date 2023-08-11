import 'package:bloodbond/common/constants/blood_enum.dart';
import 'package:bloodbond/data/models/address/coordinate.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donor.model.g.dart';

@JsonSerializable(createToJson: false)
class DonorModel {
  DonorModel({
    required this.donorId,
    required this.name,
    required this.bloodType,
    required this.description,
    required this.phone,
    required this.location,
  });

  factory DonorModel.fromJson(Map<String, dynamic> json) =>
      _$DonorModelFromJson(json);

  final String donorId;
  final String name;
  final BloodType bloodType;
  final String description;
  final String phone;
  final Coordinate location;
}
