import 'package:flutter/material.dart';
import 'package:order_delivery/scholoo/constatnts.dart';
import 'package:order_delivery/scholoo/features/init_user/initialize_user_body.dart';

class InitPageView extends StatelessWidget {
  const InitPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: InitPageBody()
    );
  }
}