import 'package:flutter_fimber/flutter_fimber.dart';

class Logger {
  static var isProduction = false;

  static init({production = false}) {
    isProduction = production;
    if (!isProduction) {
      Fimber.plantTree(FimberTree(useColors: true));
      Fimber.plantTree(DebugBufferTree.elapsed());
    } else {

    }
  }

  static error(String message, {dynamic ex}) {
    if (isProduction) {
      //todo write into crashlytics
      return;
    }

    Fimber.e(message, ex: ex);
  }

  static info(String message, {dynamic ex}) {
    if (!isProduction) {
      Fimber.i(message, ex: ex);
    }
  }

  static warning(String message, {dynamic ex}) {
    if (!isProduction) {
      Fimber.w(message, ex: ex);
    }
  }

  static debug(String message, {dynamic ex}) {
    if (!isProduction) {
      Fimber.d(message, ex: ex);
    }
  }

  static verbose(String message, {dynamic ex}) {
    if (!isProduction) {
      Fimber.v(message, ex: ex);
    }
  }
}
