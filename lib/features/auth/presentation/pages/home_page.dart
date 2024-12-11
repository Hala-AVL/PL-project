import 'package:flutter/material.dart';
import 'package:order_delivery/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flexTheme.colorScheme?.primary,
      appBar: AppBar(
        title:  Text('Home' , style: flexTheme.textTheme?.bodyMedium,),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text("Home Page")),
    );
  }
}
