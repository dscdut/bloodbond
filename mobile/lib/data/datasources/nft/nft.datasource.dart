import 'dart:convert';

import 'package:bloodbond/common/constants/endpoints.dart';
import 'package:bloodbond/common/helpers/dio.helper.dart';
import 'package:bloodbond/data/models/nft.model.dart';
import 'package:bloodbond/flavors.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NFTDataSource {
  NFTDataSource({
    required DioHelper dioHelper,
  }) : _dioHelper = dioHelper;

  final DioHelper _dioHelper;

  Future<List<NFTModel>> getNFTs() async {
    final HttpRequestResponse rawModelResponse = await _dioHelper.get(
      '${Endpoints.nft}/read_all?network=${AppFlavor.network}&address=${AppFlavor.nftAddress}',
    );

    final List<NFTRawModel> rawModel = (rawModelResponse.data['result'] as List)
        .map<NFTRawModel>((dynamic e) => NFTRawModel.fromJson(e))
        .toList();

    final List<NFTModel> nftModel = [];

    for (final NFTRawModel e in rawModel) {
      final HttpRequestResponse response = await _dioHelper.get(e.metadataUri);

      dynamic decodedMetadata = jsonDecode(response.data);

      String decodedAttribute = decodedMetadata['attributes']
          .toString()
          .replaceAll('”', '"')
          .replaceAll('“', '"')
          .replaceAll(',\n', '');

      if (decodedAttribute.contains('[{')) {
        decodedAttribute = decodedAttribute.split('[{')[1];
      }

      if (decodedAttribute.contains('}]')) {
        decodedAttribute = decodedAttribute.split('}]')[0];
      }

      decodedAttribute = '[{$decodedAttribute}]';

      final List attributes = jsonDecode(decodedAttribute) as List;

      decodedMetadata['attributes'] = attributes;

      nftModel.add(NFTModel.fromJson(decodedMetadata));
    }

    return nftModel;
  }
}
