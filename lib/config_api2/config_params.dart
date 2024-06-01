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

  String get gender => super.queryParams["gender"] ?? "";

  set gender(String val) {
    super.queryParams["gender"] = gender;
  }

  String get weight => super.queryParams["weight"] ?? "";

  set weight(String val) {
    super.queryParams["weight"] = weight;
  }

  String get height => (super.queryParams["height"] ?? '0.0');

  set height(String val) {
    super.queryParams["height"] = height;
  }

  String get neck => super.queryParams["neck"] ?? "";

  set neck(String val) {
    super.queryParams["neck"] = neck;
  }

  String get waist => super.queryParams["waist"] ?? "";

  set waist(String val) {
    super.queryParams["waist"] = waist;
  }

  String get hip => super.queryParams["hip"] ?? "";

  set hip(String val) {
    super.queryParams["hip"] = hip;
  }
}