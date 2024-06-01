import 'homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arch_krish/routing/app_router.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:arch_krish/routing/app_router.dart';
import 'dart:async';
import 'package:arch_krish/config_api/config_model.dart';
import 'package:arch_krish/config_api/config_repo.dart';
import 'package:arch_krish/config_api/config_repo.dart';
import 'package:arch_krish/utils/api_state_folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class homehttp {
  Future<String> BMIgetter(WidgetRef ref) async {
    String url='https://fitness-calculator.p.rapidapi.com/bmi?age='+ref.read(age).toString()+'&weight='+ref.read(weight).toString()+'&height='+ref.read(height).toString();
    Map<String,String> head={'X-RapidAPI-Key': '080f6c1ee2msh4a92d6cfe258b03p10115djsnc512a9eaacd2','X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com'};
    final uri=Uri.parse(url);
    final response=await http.get(uri,headers: head);
    final body=response.body;
    final json=jsonDecode(body)['data'];
    ref.read(bmi.notifier).state=json['bmi'];
    ref.read(health.notifier).state=json['health'];
    print(ref.read(bmi).toString()+'\n'+ref.read(health).toString());
    return 'done';
  }
  Future<String> BFgetter(WidgetRef ref) async {
    String url='https://fitness-calculator.p.rapidapi.com/bodyfat?age='+ref.read(age).toString()+'&gender='+(ref.read(toggleProvider)==0?'male':'female')+'&weight='+ref.read(weight).toString()+'&height='+ref.read(height).toString()+'&neck='+ref.read(neck).toString()+'&waist='+ref.read(waist).toString()+'&hip='+ref.read(hip).toString();
    Map<String,String> head={'X-RapidAPI-Key': '080f6c1ee2msh4a92d6cfe258b03p10115djsnc512a9eaacd2','X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com'};
    final uri=Uri.parse(url);
    final response=await http.get(uri,headers: head);
    final body=response.body;
    final json=jsonDecode(body)['data'];
    ref.read(bf.notifier).state=json['Body Fat (BMI method)'];
    print(ref.read(bf));
    return 'done';
  }
}