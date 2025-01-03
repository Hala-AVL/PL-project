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
    // double height = const MediaQueryData().size.height ;
    // double width = const MediaQueryData().size.height ;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          children: [
             const Padding(padding: EdgeInsets.only(top: 400 , bottom: 20),
            child: CircularProgressIndicator(
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