import 'dart:convert';

ConfigModel configModelFromJson(String str) => ConfigModel.fromJson(json.decode(str));

String configModelToJson(ConfigModel data) => json.encode(data.toJson());

class ConfigModel {
  String? request_result;
  Data? data;

  ConfigModel({
    this.request_result,
    this.data,
  });

  ConfigModel copyWith({
    String? request_result,
    Data? data,
  }) =>
      ConfigModel(
        request_result: request_result ?? this.request_result,
        data: data ?? this.data,
      );

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
    request_result: json["request_Result"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "request_result": request_result,
    "data": data?.toJson(),
  };
}

class Data {
  double? bmi;
  String? health;

  Data({
    this.bmi,
    this.health,
  });

  Data copyWith({
    double? bmi,
    String? health,
  }) =>
      Data(
        bmi: bmi ?? this.bmi,
        health: health ?? this.health,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bmi: json["bmi"]?.toDouble(),
    health: json["health"],
  );

  Map<String, dynamic> toJson() => {
    "bmi": bmi,
    "health": health,
  };
}

class Query {
  int? age;
  int? weight;
  int? height;

  Query({
    this.age,
    this.weight,
    this.height,
  });

  Query copyWith({
    int? age,
    int? weight,
    int? height,
  }) =>
      Query(
        age: age ?? this.age,
        weight: weight ?? this.weight,
        height: height ?? this.height,
      );

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    age: json["age"],
    weight: json["weight"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "weight": weight,
    "height": height,
  };
}
