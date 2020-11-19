import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/controller/helper/data_status.dart';
import 'package:flutter_clean_architecture/repo/layer/api_layer.dart';
import 'package:flutter_clean_architecture/repo/model/model.dart';
import 'package:flutter_clean_architecture/repo/network_config.dart';
import 'package:flutter_clean_architecture/utils/Logger.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeController extends GetxController {
  HomeLayer _layer;
  NetworkConfig _config;

  HomeController(this._layer, this._config);

  var status = DataStatus<List<PostModel>>(null, DataState.INIT).obs;

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }

  void getAllData() async {
    //check intent
    if (await _config.checkNetwork()) {
      status.update((val) {
        val.data = null;
        val.state = DataState.NO_INTERNET;
      });
      return;
    }

    //set state as loading
    status.update((val) {
      val.data = null;
      val.state = DataState.LOADING;
    });

    // now make request
    _layer
        .getAllData()
        .then((value) => analysisResponse(value))
        .catchError((e) {
      Logger.error("Error on HomeLayer", ex: e);
      status.update((val) {
        val.data = null;
        val.state = DataState.FAILED;
      });
    });
  }

  void analysisResponse(Response value) {
    Logger.info("Response: ${value.statusCode}");

    if (value.statusCode >= 500) {
      //that means internal server error
      //if you want to show this error
      // you can add another variable on DataStatus
      status.update((val) {
        val.data = null;
        val.state = DataState.FAILED;
      });
    } else if (value.statusCode >= 400) {
      status.update((val) {
        val.data = null;
        val.state = DataState.FAILED;
      });
    } else if (value.statusCode >= 200) {
      var data = List<PostModel>();
      value.data.forEach((element) {
        data.add(PostModel.fromJson(element));
      });

      status.update((val) {
        val.data = data;
        val.state = DataState.LOADED;
      });
    }
  }
}
