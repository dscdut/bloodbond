import 'package:json_annotation/json_annotation.dart';

part 'place.model.g.dart';

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class PlaceModel {
  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  PlaceModel({
    required this.description,
    required this.placeId,
    required this.types,
  });
  final String description;
  final String placeId;
  final List<String> types;
}
