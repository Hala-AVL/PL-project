import 'package:flutter/material.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';

class CustomErrorWidget extends StatefulWidget{
  const CustomErrorWidget({super.key});

  @override
  State<CustomErrorWidget> createState() {
    return _ErrorWidget() ;
  }

}

class _ErrorWidget extends  State<CustomErrorWidget>{
  @override
  Widget build(BuildContext context) {
    // double height = const MediaQueryData().size.height ;
    // double width = const MediaQueryData().size.height ;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top:  390 , bottom: 20) ,
            child: Text("error msg".tr(context) , style: Theme.of(context).textTheme.displayMedium,),
            ) ,
            MaterialButton(onPressed: (){
              Navigator.of(context).pop() ;
            } ,
              color: Colors.greenAccent,
              textColor:Colors.black,
              elevation: 10,
              //height: 1,
              //splashColor: Colors.grey,
            child: Text("retry".tr(context) , style: const TextStyle(fontSize: 20 ),) ,
            )
          ],
        ),
      ),
    );
  }

}