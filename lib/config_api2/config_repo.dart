
import 'package:arch_krish/config_api/config_model.dart';
import 'package:arch_krish/config_api/config_params.dart';
import 'package:arch_krish/features/homepage/homescreen.dart';
import 'package:arch_krish/utils/api/core/http_method.dart';
import 'package:arch_krish/utils/api/implementation/riverpod_api/riverpod_api.dart';
import 'package:arch_krish/utils/factory_utils.dart';
import 'package:arch_krish/utils/urls.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_repo.g.dart';

@Riverpod(keepAlive: true)
RiverpodAPI<ConfigModel, ConfigParams> ConfigRepo(ConfigRepoRef ref) {
  ConfigParams configParams = ConfigParams();
  final age = configParams.age;
  final weight = configParams.weight;
  final height = configParams.height;
  return RiverpodAPI<ConfigModel, ConfigParams>(
    completeUrl: URLs.complete("/bmi?age={$age}&weight={$weight}&height={$height}"),
    factory: FactoryUtils.modelFromString(ConfigModel.fromJson,showLog: true),
    params: configParams,
    method: HTTPMethod.get,
    ref: ref,
  );
}
