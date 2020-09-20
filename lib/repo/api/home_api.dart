import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/repo/webserver.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeApi {
  WebService _service;
  Dio _dio;

  HomeApi(this._service) {
    _dio = _service.createWebService();
  }

  Future<Response> getAllData() async {
    var response = await _dio.get("posts");
    return response;
  }
}
