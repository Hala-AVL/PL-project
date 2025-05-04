import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery/scholoo/features/splash/splash_view.dart';

void main(){
  runApp(const SchooloApp()) ;
}

class SchooloApp extends StatelessWidget{
  const SchooloApp({super.key});

  @override
  Widget build(BuildContext context) {
  return GetMaterialApp(
    theme: ThemeData.dark().copyWith(
    ),
    debugShowCheckedModeBanner: false,
    home: SplashView(),
  ) ;
  }

}