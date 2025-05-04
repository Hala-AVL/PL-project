import 'package:flutter/material.dart';

import 'add_profile_info_body.dart';

class AddProfileInfo extends StatelessWidget{
  const AddProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AddProfileInfoBody() ,
    );
  }

}