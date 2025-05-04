import 'package:flutter/material.dart';
import 'package:order_delivery/scholoo/features/forget_password/forget_password_view.dart';
import 'package:order_delivery/scholoo/features/init_user/initialize_user_body.dart';

class StudentLoginBody extends StatelessWidget {
  const StudentLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width ;
    return Form(
      child: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*.09),
            child: Image.asset("assets/splash/owlLogo.png"),
          ),
          SubTitle(
              content: "Welcome Back !",
              textAlign: TextAlign.center,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800),
          SubTitle(
              content:
                  "   Login with data that you have entered during you registration",
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black87.withBlue(30)),
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30, top: 50, bottom: 30),
            child: TextFormField(
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
                  label: SubTitle(content: " E-mail ", textAlign: TextAlign.start, fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black.withBlue(40)) ,
                  labelStyle: TextStyle(color: Colors.black.withBlue(10)),
                  suffixIcon: Icon(
                    Icons.alternate_email_outlined,
                    color: Colors.black.withBlue(1000),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue.shade900,
                        width: 2,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid),
                  ),
                  iconColor: Colors.blue,
                  label: SubTitle(content: "Password", textAlign: TextAlign.start, fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black.withBlue(40)) ,
                  labelStyle: TextStyle(color: Colors.black.withBlue(10)),
                  //icon: Icon(Icons.email_outlined),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.black.withBlue(1000),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgetPasswordView())) ;
                },
                child: SubTitle(
                    content: "Forget password?  ",
                    textAlign: TextAlign.right,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.withBlue(50))),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 20),
            child: MaterialButtonWidget(content: "Log_in"),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SubTitle(
                    content: "if you don't have an account ! ",
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
                InkWell(
                    onTap: () {},
                    child: SubTitle(
                        content: "fill Form ",
                        textAlign: TextAlign.center,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange.withBlue(50)
                    )
                ) ,
               // OTPTextField()

              ],
            ),
          )
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String content;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const SubTitle(
      {super.key,
      required this.content,
      required this.textAlign,
      required this.fontSize,
      required this.fontWeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: "SourGummy",
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}
