import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/repo/api/home_api.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeLayer {
  HomeApi _homeApi;

  HomeLayer(this._homeApi);

  Future<Response> getAllData() async {
    var response = await _homeApi.getAllData();
    return response;
  }
}
