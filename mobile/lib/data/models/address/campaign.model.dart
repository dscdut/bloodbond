import 'package:bloodbond/common/utils/json.util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campaign.model.g.dart';

@JsonSerializable(explicitToJson: true)
@JsonSerializableDateTime()
class CampaignModel {
  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);

  CampaignModel({
    this.id,
    required this.name,
    required this.address,
    this.specificAddress,
    this.isUserJoined = false,
    this.isUserGaveFeedback = false,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.registerLink,
    this.donationRequirement,
    this.otherInformation,
    this.image,
    this.coordinate,
    this.organizationName,
    this.organizationAvatar,
    this.organizationId,
  });
  @JsonKey(includeIfNull: false)
  final int? id;
  final String name;
  final String? image;
  final String address;
  final String? specificAddress;
  final Map<String, double>? coordinate;
  final String? description;
  final DateTime startDate;
  final DateTime endDate;
  final String? registerLink;
  final String? donationRequirement;
  final String? otherInformation;
  @JsonKey(includeIfNull: false, includeToJson: false)
  @JsonKey(name: 'joined', includeToJson: false)
  final bool isUserJoined;
  @JsonKey(name: 'gaveFeedback', includeToJson: false)
  final bool isUserGaveFeedback;
  final String? organizationName;
  final String? organizationAvatar;
  final int? organizationId;

  String get statusContent => isUpcoming
      ? 'Upcoming'
      : isOngoing
          ? 'Ongoing'
          : 'Ended';

  bool get isUpcoming => startDate.isAfter(DateTime.now());
  bool get isOngoing =>
      startDate.isBefore(DateTime.now()) && endDate.isAfter(DateTime.now());
  bool get isEnded => endDate.isBefore(DateTime.now());

  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);
}
