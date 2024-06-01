import 'package:arch_krish/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../config_api/config_repo.dart';
import '../../config_api2/config_repo.dart';
import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

import '../login screen/login_controller.dart';
import 'homescreen_http.dart';

class CategoryData {
  final String name;
  final String imageUrl;

  CategoryData({required this.name, required this.imageUrl});
}

final List<CategoryData> cardData = [
  CategoryData(name: 'male', imageUrl: PngAssets.male),
  CategoryData(name: 'female', imageUrl: PngAssets.female),
  CategoryData(name: "men's clothing", imageUrl: PngAssets.menIcon),
  CategoryData(name: "women's clothing", imageUrl: PngAssets.womenIcon),
];

final toggleProvider=StateProvider<int>((ref) {
  return 0;
});

final height=StateProvider((ref) => 176.0);
final weight=StateProvider((ref) => 76.0);
final age=StateProvider((ref) => 18.0);
final neck=StateProvider((ref) => 45.0);
final waist=StateProvider((ref) => 80.0);
final hip=StateProvider((ref) => 90.0);
final bmi=StateProvider((ref) => 0.0);
final health=StateProvider((ref) => "Healthy");
final bf=StateProvider((ref) => 0.0);

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Consumer(
          builder: (_,WidgetRef ref,__) {
            ref.watch(nameProvider.notifier);
            return Text(
              'Hello'+ref.read(nameProvider.notifier).state,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: BrandColor.whiteColor,
              ),
            );
          },
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                Container(
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      ref.watch(toggleProvider);
                      final toggler=ref.read(toggleProvider);
                      return InkWell(
                        child: Card(
                          child: Image.asset("assets/male.png"),
                          color: toggler==0?Colors.blueGrey:Colors.black12,
                        ),
                        onTap: () {ref.read(toggleProvider.notifier).state=(ref.read(toggleProvider)+1)%2;},
                      );
                    },
                  ),
                  width: 155.0,
                  height: 155.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
                Container(
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      ref.watch(toggleProvider);
                      final toggler=ref.read(toggleProvider);
                      return InkWell(
                        child: Card(
                          child: Image.asset("assets/female.png"),
                          color: toggler==1?Colors.blueGrey:Colors.black12,
                        ),
                        onTap: () {ref.read(toggleProvider.notifier).state=(ref.read(toggleProvider)+1)%2;},
                      );
                    },
                  ),
                  width: 155.0,
                  height: 155.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 15)),
            Container(
              child: Column(
                children: [
                  Consumer(
                    builder: (_,WidgetRef ref,__){
                      ref.watch(height);
                      final double heighter=ref.read(height);
                      return Text(heighter.toString(), style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),);
                    },
                  ),
                  Consumer(
                    builder: (_,WidgetRef ref,__){
                      ref.watch(height);
                      final double heighter=ref.read(height);
                      return Slider(
                        value: heighter,
                        min: 120,
                        max: 240,
                        divisions: 120,
                        onChanged: (double value) {ref.read(height.notifier).state=value;},
                      );
                    },
                  ),
                ],
              ),
              width: 340.0,
              height: 130.0,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 15)),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight", style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Consumer(
                          builder: (_,WidgetRef ref,__){
                            ref.watch(weight);
                            final double weighter=ref.read(weight);
                            return Text(weighter.toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),);
                          }
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(weight);
                                return IconButton(onPressed: () {ref.read(weight.notifier).state+=1;}, icon: Icon(Icons.plus_one,size: 50,),color: Colors.white,);
                              }
                          ),
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(weight);
                                return IconButton(onPressed: () {ref.read(weight.notifier).state-=1;}, icon: Icon(Icons.exposure_minus_1,color: Colors.white,size: 50,));
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                  width: 155.0,
                  height: 155.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Consumer(
                          builder: (_,WidgetRef ref,__){
                            ref.watch(age);
                            final double ager=ref.read(age);
                            return Text(ager.toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),);
                          }
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(age);
                                return IconButton(onPressed: () {ref.read(age.notifier).state+=1;}, icon: Icon(Icons.plus_one,size: 50,),color: Colors.white,);
                              }
                          ),
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(weight);
                                return IconButton(onPressed: () {ref.read(age.notifier).state-=1;}, icon: Icon(Icons.exposure_minus_1,color: Colors.white,size: 50,));
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                  width: 155.0,
                  height: 155.0,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 15)),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Neck", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Consumer(
                          builder: (_,WidgetRef ref,__){
                            ref.watch(neck);
                            final double necker=ref.read(neck);
                            return Text(necker.toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),);
                          }
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(neck);
                                return IconButton(onPressed: () {ref.read(neck.notifier).state+=1;}, icon: Icon(Icons.plus_one,size: 20,),color: Colors.white,);
                              }
                          ),
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(neck);
                                return IconButton(onPressed: () {ref.read(neck.notifier).state-=1;}, icon: Icon(Icons.exposure_minus_1,color: Colors.white,size: 20,));
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                  width: 93.33,
                  height: 93.33,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Waist", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Consumer(
                          builder: (_,WidgetRef ref,__){
                            ref.watch(waist);
                            final double waister=ref.read(waist);
                            return Text(waister.toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),);
                          }
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(waist);
                                return IconButton(onPressed: () {ref.read(waist.notifier).state+=1;}, icon: Icon(Icons.plus_one,size: 20,),color: Colors.white,);
                              }
                          ),
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(neck);
                                return IconButton(onPressed: () {ref.read(waist.notifier).state-=1;}, icon: Icon(Icons.exposure_minus_1,color: Colors.white,size: 20,));
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                  width: 93.33,
                  height: 93.33,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hip", style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Consumer(
                          builder: (_,WidgetRef ref,__){
                            ref.watch(hip);
                            final double hiper=ref.read(hip);
                            return Text(hiper.toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),);
                          }
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(hip);
                                return IconButton(onPressed: () {ref.read(hip.notifier).state+=1;}, icon: Icon(Icons.plus_one,size: 20,),color: Colors.white,);
                              }
                          ),
                          Consumer(
                              builder: (_,WidgetRef ref,__){
                                ref.watch(hip);
                                return IconButton(onPressed: () {ref.read(hip.notifier).state-=1;}, icon: Icon(Icons.exposure_minus_1,color: Colors.white,size: 20,));
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                  width: 93.33,
                  height: 93.33,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 15)),
            Container(
              alignment: Alignment.center,
              child: Consumer(
                builder: (_,WidgetRef ref,__){
                  return TextButton(
                    onPressed: () async {
                      var convertRepo = ref.watch(ConfigRepoProvider);
                      convertRepo.params.headers =  {
                        'X-RapidAPI-Key': '080f6c1ee2msh4a92d6cfe258b03p10115djsnc512a9eaacd2',
                        'X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com'
                      };
                      convertRepo.params.age=ref.read(age).toString();
                      convertRepo.params.weight=ref.read(weight).toString();
                      convertRepo.params.height=ref.read(height).toString();
                      await convertRepo.execute();
                      convertRepo = ref.watch(ConfigRepoProvider);


                      var convertRepo2 = ref.watch(ConfigRepoProvider2);
                      convertRepo2.params.headers =  {
                        'X-RapidAPI-Key': '080f6c1ee2msh4a92d6cfe258b03p10115djsnc512a9eaacd2',
                        'X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com'
                      };
                      convertRepo2.params.age=ref.read(age).toString();
                      convertRepo2.params.gender=(ref.read(toggleProvider)==0?'male':'female');
                      convertRepo2.params.weight=ref.read(weight).toString();
                      convertRepo2.params.height=ref.read(height).toString();
                      convertRepo2.params.neck=ref.read(neck).toString();
                      convertRepo2.params.waist=ref.read(waist).toString();
                      convertRepo2.params.hip=ref.read(hip).toString();
                      await convertRepo2.execute();
                      convertRepo2 = ref.watch(ConfigRepoProvider2);
                      context.pushReplacement("/result");
                    },
                    child: Text("CALCULATE",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                    ),),);
                },
              ),
              width: 400.0,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}