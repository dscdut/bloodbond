import 'dart:io';
import 'package:dio/dio.dart';
import 'package:bloodbond/common/constants/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:bloodbond/di/interceptors/app_interceptor.dart';

@lazySingleton
class DioProvider {
  DioProvider(@Named(HiveKeys.authBox) this._authBox);
  final Box _authBox;

  Dio? _dio;
  Dio getDio() => _dio ?? _createDio();

  Dio _createDio() {
    final Dio interceptorDio = Dio();
    final Dio refreshTokenDio = Dio();

    final AppInterceptor appInterceptor = AppInterceptor(
      authBox: _authBox,
      dio: refreshTokenDio,
    );
    final List<Interceptor> interceptors = <Interceptor>[];
    interceptors.add(appInterceptor);

    return interceptorDio
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.value,
      }
      ..interceptors.addAll(interceptors);
  }
}
