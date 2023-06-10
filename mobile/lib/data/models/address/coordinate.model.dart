import 'package:json_annotation/json_annotation.dart';

part 'coordinate.model.g.dart';

@JsonSerializable()
class CoordinateModel {
  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateModelFromJson(json);

  const CoordinateModel({
    required this.id,
    required this.name,
    required this.coordinate,
  });
  final int id;
  final String name;
  final Coordinate? coordinate;
}

@JsonSerializable()
class Coordinate {
  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);

  const Coordinate({
    required this.lat,
    required this.lng,
  });
  final double lat;

  final double lng;
}
