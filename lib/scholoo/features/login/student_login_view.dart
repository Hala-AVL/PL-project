
import 'package:flutter/material.dart';
import 'package:order_delivery/scholoo/features/login/student_login_body.dart';

class StudentLoginPage extends StatelessWidget {
  const StudentLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: StudentLoginBody(),
    ) ;
  }
}