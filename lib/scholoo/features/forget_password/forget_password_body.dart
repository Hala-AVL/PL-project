import 'package:flutter/material.dart';
import 'package:order_delivery/scholoo/features/profile_info/add_profile_info_view.dart';

import '../init_user/initialize_user_body.dart';

class ForgetPasswordBody extends StatefulWidget{
  const ForgetPasswordBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return ForgetPasswordState() ;
  }

}

class ForgetPasswordState extends State<ForgetPasswordBody>{
  bool? opsecureState = true ;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width ;
   return
     ListView(
       children: [
         Padding(
           padding: EdgeInsets.only(top: height*.09),
           child: SubTitle(content: "Forget Password :", textAlign: TextAlign.center, fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue.shade700),
         ) ,
         SizedBox(
           height: height*.3,
             child: Image.asset("assets/splash/secureAccount.jpg")
         ) ,
         SubTitle(content: " create new Password for more security \n and private info .", textAlign: TextAlign.center, fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black.withBlue(50)) ,
         Padding(
           padding: const EdgeInsets.all(31),
           child: textFormField("password ", Icons.lock , opsecureState!),
         ) ,
         Padding(
           padding: const EdgeInsets.only(left: 31 , right: 31 ),
           child: textFormField("confirm password ", Icons.lock , opsecureState!),
         ) ,
         CheckboxListTile(value: opsecureState,  fillColor: WidgetStatePropertyAll<Color>(Colors.orange.shade200),
             checkColor: Colors.blue.shade900,
             // hoverColor: ,
             selectedTileColor: Colors.orangeAccent,
             title: SubTitle(content: "   show password ?", textAlign: TextAlign.start, fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black.withBlue(50)),
    onChanged: (currentState){
           setState(() {
             opsecureState =  currentState;
           });

         }) ,
         const Padding(
           padding: EdgeInsets.all(40),
           child: PMaterialButtonWidget(content: "Done" , ),
         )
         ],
     );
  }

  TextFormField textFormField(String label , IconData icon , bool state ){
    return TextFormField(
      obscureText: !state,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blue.shade900,
                width: 2,
                style: BorderStyle.solid),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid),
          ),
          iconColor: Colors.blue,
        label: SubTitle(content: label, textAlign: TextAlign.start, fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black.withBlue(40)) ,
          labelStyle: TextStyle(color: Colors.black.withBlue(10)),
          prefixIcon: Icon(
            icon,
            color: Colors.orange.shade500,
          ) ,
      ),
    );
  }

}





class PMaterialButtonWidget extends StatelessWidget {
  final String content ;
  const PMaterialButtonWidget({
    super.key, required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddProfileInfo())) ;
       } ,height: 50,
        padding: const EdgeInsets.all(15),
        elevation: 20,
        colorBrightness: Brightness.dark,
        color: Colors.blue.shade900,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50) ,),
        child: Text(content ,style: const TextStyle(fontFamily: "SourGummy" , fontSize: 25 ),
        ));
  }
}