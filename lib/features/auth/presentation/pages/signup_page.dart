
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:order_delivery/features/auth/presentation/pages/login_page.dart';
import 'package:order_delivery/main.dart';
//import 'package:order_delivery/injection_container.dart' as di ;
import '../../../../core/util/lang/app_localizations.dart';
import '../bloc/auth_bloc/auth_bloc.dart';

class SignupPage extends StatelessWidget {
  static late  String phonenumber  , password  , confirmedpassword ;
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        //title: const Text('Create your account '  , style: TextStyle(letterSpacing: 2 , fontWeight: FontWeight.w800),),
        //centerTitle: true ,
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: signupformkey,
    child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text(AppLocalizations.of(context)!.translate("welcome")  , style: flexTheme.textTheme?.bodyLarge,
              )
            ),
            Text(AppLocalizations.of(context)!.translate("create"), style: flexTheme.textTheme?.bodyMedium)
          ],
        )  ,
        Padding(
          padding: const EdgeInsets.only(top: 100 , left: 13 , right: 13),
          child: TextFormField(
            style: flexTheme.textTheme?.bodySmall,
            validator: (value){
              if(value!.isEmpty){
                return AppLocalizations.of(context)!.translate("warning") ;
              }
              else if (!numberExp.hasMatch(phonenumber)){
                return AppLocalizations.of(context)!.translate("warning3") ;
              }
            },decoration: InputDecoration(
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
              borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
              fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
                  borderRadius: BorderRadius.circular(13)) ,
              label: Text(AppLocalizations.of(context)!.translate("pn")) , labelStyle: flexTheme.textTheme?.labelSmall ,
              focusColor: Colors.white
              ,prefixIcon: const Icon(Icons.numbers_outlined , color: Colors.greenAccent, )),cursorColor: Colors.white54,
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
            style: flexTheme.textTheme?.bodySmall,
            validator: (value){
              if(value!.isEmpty){
                return AppLocalizations.of(context)!.translate("warning") ;
              }
            },decoration: InputDecoration(border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
              borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
              fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
                  borderRadius: BorderRadius.circular(13)) ,
              label: Text(AppLocalizations.of(context)!.translate("pw")) , labelStyle: flexTheme.textTheme?.labelSmall
              ,prefixIcon: const Icon(Icons.password_outlined , color: Colors.greenAccent, )
          ),cursorColor: Colors.white54,
            onSaved: (value){
              password = value! ;
            },
            onChanged: (value){
              password = value ;
            },
          ),
        ) ,
        Padding(
          padding: const EdgeInsets.only(top: 27 , left: 13 , right: 13),
          child: TextFormField(
            style: flexTheme.textTheme?.bodySmall,
            validator: (value){
              if(value!.isEmpty){
                return AppLocalizations.of(context)!.translate("warning") ;
              }
              else if(password != confirmedpassword){
              return AppLocalizations.of(context)!.translate("warning2") ;
              }
            },decoration: InputDecoration(
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
                  borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
              fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
              borderRadius: BorderRadius.circular(13)) ,
              label:  Text(AppLocalizations.of(context)!.translate("cpw")) , labelStyle: flexTheme.textTheme?.labelSmall ,
              focusColor: Colors.white
              ,prefixIcon: const Icon(Icons.password_outlined , color: Colors.greenAccent, )),cursorColor: Colors.white54,
            onSaved: (value){
              confirmedpassword = value! ;
            },
            onChanged: (value){
              confirmedpassword = value ;
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
                padding: WidgetStatePropertyAll(EdgeInsets.all(15))
              ),
              onPressed: (){
                if(signupformkey.currentState!.validate()){
                  BlocProvider.of<AuthBloc>(context).add(SignupEvent(phoneNumber: phonenumber, password: password)) ;
                }
              },
              child:  Text(AppLocalizations.of(context)!.translate("SU") , style: flexTheme.textTheme?.displayMedium,)
          ),
        )  ,
        Padding(padding: const EdgeInsets.only(top: 90)  ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(AppLocalizations.of(context)!.translate("msg2") ,
                  style:  flexTheme.textTheme?.displaySmall
              )  ,
              InkWell(  onTap: (){
                Navigator.of(context).pop() ;
              }, child:  Text(AppLocalizations.of(context)!.translate("li") , style: const TextStyle(fontWeight: FontWeight.w800 , fontSize: 18 , color: Colors.greenAccent ),),
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
