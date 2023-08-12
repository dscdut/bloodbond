// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloodbond/common/helpers/dio.helper.dart' as _i11;
import 'package:bloodbond/data/datasources/map/campaign.datasource.dart' as _i4;
import 'package:bloodbond/data/datasources/map/donor.datasource.dart' as _i8;
import 'package:bloodbond/data/datasources/map/place.datasource.dart' as _i14;
import 'package:bloodbond/data/datasources/nft/nft.datasource.dart' as _i12;
import 'package:bloodbond/data/datasources/user/local/user.datasource.dart'
    as _i10;
import 'package:bloodbond/data/datasources/user/remote/user.datasource.dart'
    as _i16;
import 'package:bloodbond/data/datasources/user/user.datasource.dart' as _i17;
import 'package:bloodbond/data/repositories/campaign.repository.dart' as _i5;
import 'package:bloodbond/data/repositories/donor.repository.dart' as _i9;
import 'package:bloodbond/data/repositories/nft.repository.dart' as _i13;
import 'package:bloodbond/data/repositories/place.repository.dart' as _i15;
import 'package:bloodbond/data/repositories/user.repository.dart' as _i18;
import 'package:bloodbond/di/modules/local_module.dart' as _i19;
import 'package:bloodbond/di/modules/network_module.dart' as _i20;
import 'package:bloodbond/di/providers/dio_provider.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i7;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final localModule = _$LocalModule();
  final networkModule = _$NetworkModule();
  await gh.singletonAsync<_i3.Box<dynamic>>(
    () => localModule.authBox,
    instanceName: 'auth_box',
    preResolve: true,
  );
  gh.lazySingleton<_i4.CampaignDataSource>(() => _i4.CampaignDataSource());
  gh.lazySingleton<_i5.CampaignRepository>(
      () => _i5.CampaignRepository(dataSource: gh<_i4.CampaignDataSource>()));
  gh.lazySingleton<_i6.DioProvider>(
      () => _i6.DioProvider(gh<_i7.Box<dynamic>>(instanceName: 'auth_box')));
  gh.lazySingleton<_i8.DonorDataSource>(() => _i8.DonorDataSource());
  gh.lazySingleton<_i9.DonorRepository>(
      () => _i9.DonorRepository(gh<_i8.DonorDataSource>()));
  gh.lazySingleton<_i10.UserLocalDataSource>(() => _i10.UserLocalDataSource(
      authBox: gh<_i7.Box<dynamic>>(instanceName: 'auth_box')));
  gh.lazySingleton<_i11.DioHelper>(
      () => networkModule.provideDioHelper(gh<_i6.DioProvider>()));
  gh.lazySingleton<_i12.NFTDataSource>(
      () => _i12.NFTDataSource(dioHelper: gh<_i11.DioHelper>()));
  gh.lazySingleton<_i13.NFTRepository>(
      () => _i13.NFTRepository(dataSource: gh<_i12.NFTDataSource>()));
  gh.lazySingleton<_i14.PlaceDataSource>(
      () => _i14.PlaceDataSource(dioHelper: gh<_i11.DioHelper>()));
  gh.lazySingleton<_i15.PlaceRepository>(
      () => _i15.PlaceRepository(placeDataSource: gh<_i14.PlaceDataSource>()));
  gh.lazySingleton<_i16.UserRemoteDataSource>(
      () => _i16.UserRemoteDataSource(dioHelper: gh<_i11.DioHelper>()));
  gh.lazySingleton<_i17.UserDataSource>(() => _i17.UserDataSource(
        remoteDataSource: gh<_i16.UserRemoteDataSource>(),
        localDataSource: gh<_i10.UserLocalDataSource>(),
      ));
  gh.lazySingleton<_i18.UserRepository>(
      () => _i18.UserRepository(dataSource: gh<_i17.UserDataSource>()));
  return getIt;
}

class _$LocalModule extends _i19.LocalModule {}

class _$NetworkModule extends _i20.NetworkModule {}
