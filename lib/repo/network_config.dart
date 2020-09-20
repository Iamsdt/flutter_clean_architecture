import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_clean_architecture/my_env.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkConfig {
  String userDeviceType = Platform.operatingSystem;

  String getBaseUrl() {
    if (MyEnvironment.isProduction) {
      return "https://jsonplaceholder.typicode.com/";
    } else {
      return "https://jsonplaceholder.typicode.com/";
    }
  }

  Future<bool> checkNetwork() async {
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.none;
  }
}
