import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/di/config_inject.dart';
import 'package:flutter_clean_architecture/ui/home/home_page.dart';
import 'package:flutter_clean_architecture/utils/Logger.dart';
import 'package:get/get.dart';

void main() {
  Logger.init();

  // inject first
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageUI(),
    );
  }
}
