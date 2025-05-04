
// import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:order_delivery/halaCore/api/api_consumer.dart';
import 'package:order_delivery/halaCore/api/dio_consumer.dart';
import 'package:order_delivery/halarepository/user_repo.dart';
// import 'package:order_delivery/api.dart';
//import 'package:order_delivery/user_cubit/user_cubit.dart' as cubit;
import 'package:order_delivery/user_cubit/user_cubit.dart';
import 'package:order_delivery/user_cubit/user_states.dart';
// import 'package:order_delivery/features/auth/presentation/widgets/custom_text_form_field.dart';
void main(){
  runApp( Api()) ;
}

class Api extends StatelessWidget {
  final UserCubit cubit = UserCubit(UserRepository(api: DioConsumer(dio: Dio()))) ;
  final TextEditingController controller = TextEditingController() ;
   Api({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
   if(state is SignInSuccess){
     const SnackBar(content: Text("Success")) ;
   }
   else if(state is SignInFailure){
      SnackBar(content: Text(state.errMessage)) ;
   }
  },
  builder: (context, state) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey.shade900,
          centerTitle: true ,
          title: const Text("Snacks App" ,
            style: TextStyle(color :  Colors.white ,
                fontWeight: FontWeight.w900 ,
                fontSize: 30),
          ),
        ),
        body:  Form(
          key: cubit.signInFormKey,
          child: Padding(
            padding: EdgeInsets.only(top: height*0.28),
            child: Center(
              child: ListView(
                children: [
                 Padding(
                   padding:  EdgeInsets.all(width*0.03),
                   child: TextFormField(
                     controller: cubit.signInEmail,
                     style: const TextStyle(color: Colors.white),
                     cursorColor: Colors.blue.shade900,
                     decoration: InputDecoration(
                     label: const Text("snack's name") ,
                     labelStyle: const TextStyle(color: Colors.white70 ,
                         fontWeight: FontWeight.w800) ,
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                         borderSide: const BorderSide(
                             color: Colors.blue,
                             style: BorderStyle.solid
                         )
                     ),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                         borderSide: const BorderSide(
                       color: Colors.white,
                       style: BorderStyle.solid

                     )
                     ),
                     prefixIcon: const Icon(Icons.sailing , color: Colors.blue,) ,
                   ),
                   ),
                 ) ,
                  Padding(
                    padding:  EdgeInsets.only(left : width*0.03 , right : width*0.03 ),
                    child: TextFormField(
                      controller: cubit.signInPassword,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.blue.shade900,
                      decoration: InputDecoration(
                          label: const Text("snack's Email") ,
                          labelStyle: const TextStyle(color: Colors.white70 ,
                              fontWeight: FontWeight.w800) ,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid

                              )
                          ),
                          prefixIcon: const Icon(Icons.email_outlined , color: Colors.blue,)
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*0.3 , left :width*0.15 , right: width*0.15),
                  child: MaterialButton(onPressed: (){
                    BlocProvider.of<UserCubit>(context).signIn() ;
                  //  signup(username, email)
                  } ,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    color: Colors.blue,
                    autofocus: true,
                    focusColor: Colors.greenAccent,
                    focusNode: FocusNode(debugLabel: "hala"),
                    mouseCursor: MouseCursor.uncontrolled,
                    elevation: 10,
                    colorBrightness: Brightness.light,
                   // padding: EdgeInsets.symmetric(horizontal: 0.2),
                    splashColor: Colors.blue.shade900,
                  child: const Text("Sign IN" , ),
                  ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  },
),
    ) ;
  }


}