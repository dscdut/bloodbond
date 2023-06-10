import 'package:json_annotation/json_annotation.dart';

part 'address.model.g.dart';

@JsonSerializable()
class AddressModel {
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  AddressModel({
    required this.province,
    required this.district,
    required this.ward,
    required this.specificAddress,
  });
  final String province;
  final String district;
  final String ward;
  final String specificAddress;

  String get fullAddress => '$specificAddress, $ward, $district, $province';

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
