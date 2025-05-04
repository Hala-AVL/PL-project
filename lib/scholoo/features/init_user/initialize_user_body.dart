import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_delivery/scholoo/constatnts.dart';

import '../login/student_login_view.dart';

class InitPageBody extends StatelessWidget {
  const InitPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ListView(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(kLogo, fit: BoxFit.cover,) ,
              Padding(
                padding: EdgeInsets.only(top: height*.5 , left: width*.01, right: width*.01 , bottom: height*.07),
                child: Container(decoration: BoxDecoration(
                  color: Colors.white ,
                 backgroundBlendMode: BlendMode.hardLight,
                 // boxShadow: [BoxShadow(color: Colors.black87)],
                  gradient: LinearGradient(colors: [Colors.white , Colors.orangeAccent.shade100]
                  ),
                  borderRadius: BorderRadius.circular(40) ,
                ),
                  child: ListView(
                      children:  [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SubTitle(content: "  WELCOME !" , textAlign: TextAlign.start, fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue.shade900) ,
                        ) ,
                        SubTitle(content: "here we are to service you in your educative life time we wish you enjoy and love  it", textAlign: TextAlign.center, fontSize: 25, fontWeight: FontWeight.normal, color: Colors.black87.withBlue(70)),
                        const Padding(
                          padding: EdgeInsets.only(left: 20 , right: 20 , top: 25),
                          child: MaterialButtonWidget( content: "continue as a Student",),
                        ) ,
                        SubTitle(content: "Or", textAlign: TextAlign.center, fontSize: 25, fontWeight: FontWeight.normal, color: Colors.black87.withBlue(70)),
                        const Padding(
                          padding: EdgeInsets.only(left: 20 , right: 20),
                          child: MaterialButtonWidget(content: "Continue as a Teacher") 
                        ) ,

                      ],
                  ),
                )
              ) ,
           Padding(
            padding: EdgeInsets.only(top: height*0.95),
            child: SubTitle(content: "Version 1.0.0.0", textAlign: TextAlign.center, fontSize: 25, fontWeight: FontWeight.normal, color: Colors.orangeAccent.shade100),
          )
                  ],
          ),
        )
      ],
    )
    );
  }
}

class MaterialButtonWidget extends StatelessWidget {
  final String content ;
  const MaterialButtonWidget({
    super.key, required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){
      Get.to(() => const StudentLoginPage() , transition: Transition.cupertino) ;
    } ,height: 50,
        padding: const EdgeInsets.all(15),
        elevation: 20,
        colorBrightness: Brightness.dark,
        color: Colors.blue.shade900,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50) ,),
      child: Text(content ,style: const TextStyle(fontFamily: "SourGummy" , fontSize: 25 ),
    ));
  }
}


class SubTitle extends StatelessWidget{
  final String content ;
  final TextAlign textAlign ;
  final double fontSize ;
  final FontWeight fontWeight ;
  final Color color ;
  const SubTitle({super.key, required this.content, required this.textAlign, required this.fontSize, required this.fontWeight, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(content , textAlign: textAlign,
      style: TextStyle(fontFamily: "SourGummy" , fontSize: fontSize ,fontWeight: fontWeight, color: color),
    );
  }
  
}

