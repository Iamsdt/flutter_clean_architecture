import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/my_env.dart';
import 'package:flutter_clean_architecture/repo/network_config.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class WebService {
  NetworkConfig _config;

  WebService(this._config);

  Dio createWebService() {
    var request = BaseOptions(
      baseUrl: _config.getBaseUrl(),
    );

    var _instance = Dio(request);
    if (!MyEnvironment.isProduction) {
      _instance.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    return _instance;
  }
}
