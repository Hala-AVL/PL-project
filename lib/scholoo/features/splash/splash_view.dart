import 'package:flutter/material.dart';
import 'package:order_delivery/scholoo/constatnts.dart';
import 'package:order_delivery/scholoo/features/splash/splash_view_body.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key});


  @override
  Widget build(BuildContext context) {
     return const Scaffold(
       backgroundColor: kPrimaryColor,
       body: SplashViewBody() ,
     );
  }

}
