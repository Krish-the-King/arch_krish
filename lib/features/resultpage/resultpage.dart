import 'package:arch_krish/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../homepage/homescreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/colors.dart';
import '../../constants/textstyles.dart';

class result extends StatefulWidget {
  const result({super.key});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
            Container(
              child: Consumer(
                builder: (_,WidgetRef ref,__) {
                  return(Column(
                    children: [
                      Text(
                        'BMI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ref.read(bmi.notifier).state.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ));
                },
              ),
              width: 380.0,
              height: 180.0,
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
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
            Container(
              child: Consumer(
                builder: (_,WidgetRef ref,__) {
                  return(Column(
                    children: [
                      Text(
                        'Body Fat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ref.read(bf.notifier).state.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ));
                },
              ),
              width: 380.0,
              height: 180.0,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
            ),Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
            Container(
              child: Consumer(
                builder: (_,WidgetRef ref,__) {
                  return(Column(
                    children: [
                      Text(
                        'Health',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ref.read(health.notifier).state,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ));
                },
              ),
              width: 380.0,
              height: 180.0,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
            ),Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
            Container(
              alignment: Alignment.center,
              child: Consumer(
                builder: (_,WidgetRef ref,__){
                  return TextButton(
                    onPressed: () async {
                      context.pushReplacement("/home");
                    },
                    child: Text("UPDATE",style: TextStyle(
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
