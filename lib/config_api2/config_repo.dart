
import 'package:arch_krish/config_api2/config_model.dart';
import 'package:arch_krish/config_api2/config_params.dart';
import 'package:arch_krish/features/homepage/homescreen.dart';
import 'package:arch_krish/utils/api/core/http_method.dart';
import 'package:arch_krish/utils/api/implementation/riverpod_api/riverpod_api.dart';
import 'package:arch_krish/utils/factory_utils.dart';
import 'package:arch_krish/utils/urls.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_repo.g.dart';

@Riverpod(keepAlive: true)
RiverpodAPI<ConfigModel, ConfigParams> ConfigRepo2(ConfigRepoRef ref) {
  ConfigParams configParams = ConfigParams();
  final age = configParams.age;
  final gender = configParams.gender;
  final weight = configParams.weight;
  final height = configParams.height;
  final neck = configParams.neck;
  final waist = configParams.waist;
  final hip = configParams.hip;

  return RiverpodAPI<ConfigModel, ConfigParams>(
    completeUrl: URLs.complete("/bodyfat?age={$age}&gender={$gender}&weight={$weight}&height={$height}&neck={$neck}&waist={$waist}&hip={$hip}"),
    factory: FactoryUtils.modelFromString(ConfigModel.fromJson,showLog: true),
    params: configParams,
    method: HTTPMethod.get,
    ref: ref,
  );
}
