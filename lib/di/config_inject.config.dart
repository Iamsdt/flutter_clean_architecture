// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../repo/api/home_api.dart';
import '../controller/home_controller.dart';
import '../repo/layer/api_layer.dart';
import '../repo/network_config.dart';
import '../repo/webserver.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<NetworkConfig>(() => NetworkConfig());
  gh.lazySingleton<WebService>(() => WebService(get<NetworkConfig>()));
  gh.lazySingleton<HomeApi>(() => HomeApi(get<WebService>()));
  gh.lazySingleton<HomeLayer>(() => HomeLayer(get<HomeApi>()));
  gh.lazySingleton<HomeController>(
      () => HomeController(get<HomeLayer>(), get<NetworkConfig>()));
  return get;
}
