import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_delivery/features/auth/presentation/pages/update_profile_page.dart';
import 'package:order_delivery/core/util/lang/app_localizations.dart';
import '../../domain/enitities/user_entity.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import 'signup_page.dart';
import 'package:order_delivery/main.dart';
class LoginPage extends StatelessWidget {

  static late  String phonenumber  , password ;
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      // appBar: AppBar(
      //   title: const Text('Login Page'),
      // ),
      body: Form(
        key: loginformkey,
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
                   Padding(
                    padding: const EdgeInsets.only(top: 170),
                    child: Row(
                      mainAxisAlignment :  MainAxisAlignment.center ,
                       children: [
                      const Icon(Icons.delivery_dining_outlined , size: 90 ,color: Colors.greenAccent,
                      ) ,
                      Text("SPEEDY SERVE" ,style: flexTheme.textTheme?.bodyLarge ,)
                    ],),
                  )  ,
              Padding(
                padding: const EdgeInsets.only(top: 100 , left: 13 , right: 13),
                child: TextFormField(
                  controller: controller,
                  style: flexTheme.textTheme?.displaySmall,
                  validator: (value){
                    if(value!.isEmpty){
                      return AppLocalizations.of(context)!.translate("warning") ;
                    }
                  },
                  decoration: InputDecoration(border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
                    borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
                    fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
                    borderRadius: BorderRadius.circular(13)) ,
                    label:  Text(AppLocalizations.of(context)!.translate("pn")) , labelStyle: flexTheme.textTheme?.labelSmall
                    ,prefixIcon: const Icon(Icons.numbers_outlined , color: Colors.greenAccent, )
                  ),cursorColor: Colors.white54,
                  onSaved: (value){
                    phonenumber = value! ;
                },
                  onChanged: (value){
                    phonenumber = value ;
                  },
                ),

              )
          ,
              Padding(
                padding: const EdgeInsets.only(top: 27 , left: 13 , right: 13 ),
                child: TextFormField(
                  style: flexTheme.textTheme?.displaySmall,
                  validator: (value){
                    if(value!.isEmpty){
                      return AppLocalizations.of(context)!.translate("warning") ;
                    }
                  },
                  decoration: InputDecoration(border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
                    borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
                    fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
                        borderRadius: BorderRadius.circular(13)) ,
                    label:  Text(AppLocalizations.of(context)!.translate("pw")) , labelStyle:  flexTheme.textTheme?.labelSmall
                    ,prefixIcon: const Icon(Icons.password_outlined , color: Colors.greenAccent, )),cursorColor: Colors.white54,
                onSaved: (value){
                 password = value! ;
                },
                  onChanged: (value){
                    password = value ;
                  },
                ),
              ) ,
               Padding(
                 padding: const EdgeInsets.all(35),
                 child: ElevatedButton(
                   style: const ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.greenAccent)  ,
                   foregroundColor: WidgetStatePropertyAll(Colors.black) ,
                     elevation: WidgetStatePropertyAll(7) ,
                     shadowColor: WidgetStatePropertyAll(Colors.grey) ,
                       padding: WidgetStatePropertyAll(EdgeInsets.all(15))),

                    onPressed: (){
                     if(loginformkey.currentState!.validate()){
                       BlocProvider.of<AuthBloc>(context).add(LoginEvent(phoneNumber: phonenumber, password: password)) ;
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UpdateProfilePage())) ;
                     }
                    },
                    child:  Text(AppLocalizations.of(context)!.translate("LI") , style: flexTheme.textTheme?.displayMedium,)
                 ),
               ) ,
               Padding(padding: const EdgeInsets.only(top: 160)  ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(AppLocalizations.of(context)!.translate("msg1") ,
                      style:  flexTheme.textTheme?.displaySmall
                  )  ,
                  InkWell(  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignupPage())) ;
                  }, child:  Text(AppLocalizations.of(context)!.translate("su") , style: const TextStyle(fontWeight: FontWeight.w800 , fontSize: 18 , color: Colors.greenAccent),),
                  )
                ],
              ),)

            ],
          ),
        ),
      ),
    );
  }
}
