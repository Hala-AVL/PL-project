
import 'package:flutter/material.dart';

import 'forget_password_body.dart';
//import 'package:order_delivery/scholoo/features/login/student_login_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      //appBar: PreferredSize(preferredSize: Size(400, 400), child: Text("")),
      body: ForgetPasswordBody(),
    ) ;
  }
}