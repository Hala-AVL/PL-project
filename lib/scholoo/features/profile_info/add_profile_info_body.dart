import 'package:flutter/material.dart';
import 'package:order_delivery/scholoo/features/init_user/initialize_user_body.dart';

class AddProfileInfoBody extends StatefulWidget {
  const AddProfileInfoBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProfileInfoPage();
  }
}

class ProfileInfoPage extends State<AddProfileInfoBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * .1, bottom: height * .01),
          child: SubTitle(
              content: "Add Profile Info :",
              textAlign: TextAlign.center,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade500),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * .03, top: height * .02),
          child: SubTitle(
              content:
                  "add profile info that will appear to others \n that have your account  .",
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black.withBlue(30)),
        ),
        SizedBox(
          child: Center(
            child: Stack(
              children: [
                Container(
                    width: width * .56,
                    height: height * .25,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(1000),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/splash/avatar.png")))),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: width * .13,
                    height: height * .06,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(1000),

                      // image: const DecorationImage(
                      //     fit: BoxFit.cover,
                      //     image: AssetImage("assets/splash/schooloLogo.jpg")
                      // )
                    ),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(context: context,
                            backgroundColor:  Colors.grey.shade300,
                            barrierLabel: "from ",
                            showDragHandle: true,
                            enableDrag: true,
                            builder: (context) {
                          return SizedBox(
                            height: height*.2,
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: SubTitle(content: "  choose from ?", textAlign: TextAlign.start, fontSize: 22, fontWeight: FontWeight.bold, color:  Colors.black.withBlue(30)),
                                ) ,
                                Center(
                                  child: SizedBox(
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        chooseFrom( Icons.camera, "Camera" ,  height , width) ,
                                       const SizedBox(width: 25,) ,
                                        chooseFrom( Icons.photo, "Gallery",  height , width) ,
                                        const SizedBox(width: 25,) ,
                                        InkWell(
                                            child:
                                        chooseFrom( Icons.person_outline_rounded, "Avatar",  height , width))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ) ;
                        }) ;
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        size: 34,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: height * .03, right: height * .03, top: height * .05),
          child: textFormField("Account_name", Icons.manage_accounts_rounded),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: height * .04, right: height * .04, top: height * .06),
          child: const PMaterialButtonWidget(content: "Continue "),
        )
      ],
    );
  }

  void showAvatars(double height , double width){
    showModalBottomSheet(context: context,
    backgroundColor:  Colors.grey.shade300,
       // barrierLabel: "from ",
        showDragHandle: true,
        enableDrag: true,
        builder: (context)
    {
      return Center(
        child: SizedBox(
          width: width,
          height: height,
          child: GridView.builder(
            itemCount: 5 ,
              itemBuilder: (context , index){
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  fit: BoxFit.fill,
                    image: AssetImage("assets/splash/${index+1}.jpg"))
              ),
            );
          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3 ,
          crossAxisSpacing: 20 ,
          mainAxisSpacing: 15),)
        ),
      );
    }) ;
  }

  Widget chooseFrom(IconData icon , String label , double h , double w){
    return Column(
      children: [
        Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(onPressed: (){
              showAvatars(h*.4,  w) ;
            }, icon: Icon(icon , color: Colors.blue.shade500,size: 60,))
        ),
        SubTitle(content: label, textAlign: TextAlign.center, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black.withBlue(30))
      ],
    ) ;
  }

  TextFormField textFormField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.blue.shade900, width: 2, style: BorderStyle.solid),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black, width: 2, style: BorderStyle.solid),
        ),
        iconColor: Colors.blue,
        label: SubTitle(
            content: "account_name ",
            textAlign: TextAlign.start,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black.withBlue(40)),
        labelStyle: TextStyle(color: Colors.black.withBlue(10)),
        prefixIcon: Icon(
          icon,
          color: Colors.orange.shade700,
        ),
      ),
    );
  }
}

class PMaterialButtonWidget extends StatelessWidget {
  final String content;
  const PMaterialButtonWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddProfileInfo())) ;
        },
        height: 50,
        padding: const EdgeInsets.all(15),
        elevation: 20,
        colorBrightness: Brightness.dark,
        color: Colors.blue.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          content,
          style: const TextStyle(fontFamily: "SourGummy", fontSize: 25),
        ));
  }
}
