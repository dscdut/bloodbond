// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NFTRawModel _$NFTRawModelFromJson(Map<String, dynamic> json) => NFTRawModel(
      metadataUri: json['metadata_uri'] as String,
    );

Attribute _$AttributeFromJson(Map<String, dynamic> json) => Attribute(
      traitType: json['trait_type'] as String?,
      timestamp: json['timestamp'] as String?,
      operationName: json['operation_name'] as String?,
      capacity: json['capacity'] as String?,
      organizationName: json['organization_name'] as String?,
      bloodType: json['blood_type'] as String?,
      bilirubin: json['bilirubin'] as String?,
      rbc: json['rbc'] as String?,
    );

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      address: json['address'] as String?,
      share: json['share'] as int?,
    );

File _$FileFromJson(Map<String, dynamic> json) => File(
      uri: json['uri'] as String?,
      type: json['type'] as String?,
    );

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      creators: (json['creators'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Creator.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : File.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

NFTModel _$NFTModelFromJson(Map<String, dynamic> json) => NFTModel(
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      description: json['description'] as String?,
      sellerFeeBasisPoints: json['seller_fee_basis_points'] as int?,
      externalUrl: json['external_url'] as String?,
      image: json['image'] as String?,
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
    );
