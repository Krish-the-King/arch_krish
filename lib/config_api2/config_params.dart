import 'package:arch_krish/utils/api/implementation/simple_api/simple_params.dart';

class ConfigParams extends SimpleParameters {
  Map<String, String> get headers => super.headers;

  set header(Map<String, String> _headers) {
    super.headers = _headers;
  }

  String get age => super.queryParams["age"] ?? "";

  set age(String val){
    super.queryParams["age"] = age;
  }

  String get weight => super.queryParams["weight"] ?? "";

  set weight(String val) {
    super.queryParams["weight"] = weight;
  }

  String get height => (super.queryParams["height"] ?? '0.0');

  set height(String bmi) {
    super.queryParams["height"] = height;
  }
}