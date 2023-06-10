import 'package:json_annotation/json_annotation.dart';

part 'map_marker.model.g.dart';

@JsonSerializable()
class MapMarkerModel {
  const MapMarkerModel({
    required this.lat,
    required this.lng,
    required this.id,
  });
  final double lat;
  final double lng;
  final String id;
}
