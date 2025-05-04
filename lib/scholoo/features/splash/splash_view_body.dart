import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../constatnts.dart';
import '../init_user/initialize_user_view.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashBody();
  }
}

class SplashBody extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController ;
  late Animation<Offset> animation ;
  
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this , duration: const Duration(seconds: 1)) ;
    animation = Tween<Offset>(begin: const Offset(0, 0) , end: Offset.zero ).animate(animationController) ;
    animationController.forward() ;
    Future.delayed(const Duration(seconds: 3 ) , () {Get.to(()=> const InitPageView() , transition: Transition.downToUp);},) ;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose() ;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return ListView(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(kLogo, fit: BoxFit.cover,) ,
              // SlideTransition(
              //   position: animation,
              //   child: Padding(
              //     padding: EdgeInsets.only(top: height*.38),
              //       child:  AnimatedBuilder(
              //         animation: animation,
              //         builder: (BuildContext context, Widget? child) {
              //           return  const Text("all your educative lessons is here" , textAlign: TextAlign.center,
              //             style: TextStyle(fontFamily: "SourGummy"),
              //           ) ;
              //         },
              //       )),
              // ) ,
          Padding(
                padding: EdgeInsets.only(top: height*.38),
                  child: const Text("all your educative lessons is here" , textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: "SourGummy"),
                      ) ,) ,
              Padding(padding: EdgeInsets.only(top: height*.65) ,
              child: Center(
                  child: LoadingAnimationWidget.hexagonDots(color: Colors.yellow.shade400, size: 55)),)
            ],
          ),
        )
      ],
    ) ;
  }
  
}
