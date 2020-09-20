import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/controller/helper/data_status.dart';
import 'package:flutter_clean_architecture/controller/home_controller.dart';
import 'package:flutter_clean_architecture/di/config_inject.dart';
import 'package:flutter_clean_architecture/ui/home/home_page_helper.dart';
import 'package:get/get.dart';

class HomePageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        child: GetX(
          init: getIt<HomeController>(),
          builder: (HomeController s) {
            var state = s.status.value;
            switch (state.state) {
              case DataState.INIT:
              case DataState.LOADING:
                return HomePageHelper.showProgress();
              case DataState.LOADED:
                return HomePageHelper.showListData(state.data);
              case DataState.FAILED:
                return HomePageHelper.showError();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
