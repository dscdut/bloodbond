import 'package:json_annotation/json_annotation.dart';

part 'nft.model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class NFTRawModel {
  NFTRawModel({
    required this.metadataUri,
  });

  factory NFTRawModel.fromJson(Map<String, dynamic> json) =>
      _$NFTRawModelFromJson(json);

  final String metadataUri;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Attribute {
  Attribute({
    required this.traitType,
    required this.timestamp,
    required this.operationName,
    required this.capacity,
    required this.organizationName,
    required this.bloodType,
    required this.bilirubin,
    required this.rbc,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  final String traitType;
  final String timestamp;
  final String operationName;
  final String capacity;
  final String organizationName;
  final String bloodType;
  final String bilirubin;
  final String rbc;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class Creator {
  Creator({
    required this.address,
    required this.share,
  });

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  final String address;
  final int share;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class File {
  File({
    required this.uri,
    required this.type,
  });

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  final String uri;
  final String type;
}

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Properties {
  Properties({
    required this.creators,
    required this.files,
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  final List<Creator> creators;
  final List<File> files;
}

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class NFTModel {
  NFTModel({
    required this.name,
    required this.symbol,
    required this.description,
    required this.sellerFeeBasisPoints,
    required this.externalUrl,
    required this.image,
    required this.attributes,
    required this.properties,
  });

  factory NFTModel.fromJson(Map<String, dynamic> json) =>
      _$NFTModelFromJson(json);

  final String name;
  final String symbol;
  final String description;
  final int sellerFeeBasisPoints;
  final String externalUrl;
  final String image;
  final List<Attribute> attributes;
  final Properties properties;
}
