 import 'package:flutter/material.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';

class CustomLoadingWidget extends StatefulWidget{
  const CustomLoadingWidget({super.key});

  @override
  State<CustomLoadingWidget> createState() {
    return _LoadingWidget() ;
  }

}

class _LoadingWidget extends  State<CustomLoadingWidget>{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
   // double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: height*0.5 , bottom: 20),
            child: const CircularProgressIndicator(
              color: Colors.greenAccent,
              ),
            ) ,
            Text("loading".tr(context) , style: Theme.of(context).textTheme.displayMedium,),
          ],
        ),
      ),
    );
  }

}