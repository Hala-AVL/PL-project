import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_delivery/features/auth/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:order_delivery/features/auth/presentation/pages/home_page.dart';
// import 'package:path/path.dart';
// import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:order_delivery/main.dart';
import 'package:order_delivery/'
    'injection_container.dart' as di;


class UpdateProfile extends StatefulWidget{
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() {
     return UpdateProfilePage() ;
  }

}

class UpdateProfilePage extends State<UpdateProfile> {

   late File? image ;
   late String? firstusername , secondusername , location  ;
   UpdateProfilePage({ this.image, this.firstusername});
    
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
  create: (context) => di.sl<UserBloc>(),
  child: Scaffold(
        backgroundColor: flexTheme.colorScheme?.primary,
        appBar: AppBar(
          backgroundColor: flexTheme.colorScheme?.primary,
          title:  Text("Update Profile Page "  , style: flexTheme.textTheme?.bodyMedium,),
        ),
        body:  SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Form(
            key: updateformkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50 , bottom: 20),
                  child: Text("add profile picture : " , style: flexTheme.textTheme?.bodySmall,),
                ) ,
                Center(
                  child:
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
            BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if(state is UpdatedUserProfileState){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomePage())) ;
                }
                else if (state is LoadingState){
                  showDialog(context: context, builder: (context){
                    return const Dialog(
                      child: AlertDialog(
                        content: Text("are you sure ? "),
                      ),
                    ) ;
                  }) ;
                }
              },
              child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return ClipOval(
                    child: image == null ?
                    Container(
            color: Colors.grey,
            width: 160 ,
            height: 160,
            child: IconButton(onPressed: (){
              showMenu(context: context, position: const RelativeRect.fromLTRB(90, 260, 90 , 0), items: [
                PopupMenuItem(child: const ListTile(leading: Icon(Icons.folder , color: Colors.green,),
                  title: Text("from gallery ") ,
                ),
                  onTap: (){
                    pickImage(ImageSource.gallery) ;
                  },) ,
                PopupMenuItem(child: const ListTile(leading: Icon(Icons.camera , color: Colors.green,),
                  title: Text("from camera ") ,
                ) , onTap: (){
                  pickImage(ImageSource.camera) ;
                },) ,
              ]) ;
            }, icon: const Icon(Icons.add , size: 40, color: Colors.greenAccent,)
            ),
                    ):
                        SizedBox(
                          height: 160 ,
                          width: 160,
                          child:  Image.file(image!),
                        )
                );

              },
            ),
            ),
            Positioned(
              left: 110,
              right: 0,
              top: 120,
              child: ClipOval(
                child: Container(
                  color: Colors.greenAccent,
                  height: 50 ,
                  width: 50,
                  child: IconButton(onPressed: (){
                    showMenu(context: context, position: const RelativeRect.fromLTRB(90, 260, 90 , 0), items: [
                      PopupMenuItem(child: const ListTile(leading: Icon(Icons.folder , color: Colors.green,),
                        title: Text("from gallery ") ,
                      ),
                        onTap: (){
                          pickImage(ImageSource.gallery) ;
                        },) ,
                      PopupMenuItem(child: const ListTile(leading: Icon(Icons.camera , color: Colors.green,),
                        title: Text("from camera ") ,
                      ) , onTap: (){
                        pickImage(ImageSource.camera) ;
                        },) ,
                    ]) ;
                  }, icon: const Icon(Icons.add_a_photo_outlined  , size: 30,color: Colors.black,)),
                ),
              ),
            )
                    ],
                  )
                ) ,
               Padding(padding: const EdgeInsets.only(bottom: 20 , top: 50) ,
               child: Text("add extra info about your self : ", style: flexTheme.textTheme?.headlineMedium,),) ,
               // const Spacer() ,
                Padding(padding: const EdgeInsets.all(8),
                child:  TextFormField(
                  style: flexTheme.textTheme?.bodySmall,
                  validator: (value){
                    if(value!.isEmpty){
                      return "this field shouldn't be Empty" ;
                    }
                  },decoration: InputDecoration(
                    border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
                        borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
                    fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
                    borderRadius: BorderRadius.circular(13)) ,
                    label: const Text("first name") , labelStyle: flexTheme.textTheme?.labelSmall ,
                    focusColor: Colors.white
                    ,prefixIcon: const Icon(Icons.man , color: Colors.greenAccent, )),cursorColor: Colors.white54,
                  onSaved: (value){
                     firstusername = value! ;
                  },
                  onChanged: (value){
                    firstusername = value ;
                  },
                ),
                )  ,

                Padding(padding: const EdgeInsets.all(8),
                  child:  TextFormField(
                    style: flexTheme.textTheme?.bodySmall,
                    validator: (value){
                      if(value!.isEmpty){
                        return "this field shouldn't be Empty" ;
                      }
                    },decoration: InputDecoration(
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
                          borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
                      fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
                      borderRadius: BorderRadius.circular(13)) ,
                      label:const Text("last name") , labelStyle: flexTheme.textTheme?.labelSmall ,
                      focusColor: Colors.white
                      ,prefixIcon: const Icon(Icons.man_2 , color: Colors.greenAccent, )),cursorColor: Colors.white54,
                    onSaved: (value){
                      secondusername = value! ;
                    },
                    onChanged: (value){
                      secondusername = value ;
                    },
                  ),
                )  ,

                Padding(padding: const EdgeInsets.all(8),
                  child:  TextFormField(
                    style: flexTheme.textTheme?.bodySmall,
                    validator: (value){
                      if(value!.isEmpty){
                        return "this field shouldn't be Empty" ;
                      }
                    },decoration: InputDecoration(
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)) ,
                          borderSide: BorderSide(color: Colors.white ,style: BorderStyle.solid) ) ,
                      fillColor: Colors.grey.shade900 , filled: true  , focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3 , color: Colors.white54 , ) ,
                      borderRadius: BorderRadius.circular(13)) ,
                      label: const Text("location") , labelStyle: flexTheme.textTheme?.labelSmall ,
                      focusColor: Colors.white
                      ,prefixIcon: const Icon(Icons.location_on_outlined , color: Colors.greenAccent, )),cursorColor: Colors.white54,
                    onSaved: (value){
                      location = value! ;
                    },
                    onChanged: (value){
                      location = value ;
                    },
                  ),
                )  ,
                Padding(padding: const EdgeInsets.only(top: 0) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(onPressed: (){
                   if(updateformkey.currentState!.validate()){
                     BlocProvider.of<UserBloc>(context).add(UpdateUserProfileEvent(firstName: firstusername!, lastName: secondusername!, location: location!, token: "" , image: image)) ;
                   }
                      },style: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black) ,
                   backgroundColor:  WidgetStatePropertyAll(Colors.greenAccent)),
                        child: const Text("finish" ,)) ,
                    const SizedBox(width: 20,) ,
                    OutlinedButton(onPressed: (){
                      // push replacement
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage())) ;
                    },
                        style: const ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black) ,
                            backgroundColor:  WidgetStatePropertyAll(Colors.greenAccent)),
                        child:const Text("Skip")) ,
                  ],
                ),)

              ],
            ),
          ),
        ),
      ),
);
  }
  
  
  
  Future pickImage(ImageSource source ) async{
    var image = await ImagePicker().pickImage(source: source) ;
    if(image == null) return ;
   setState(() {
     this.image = File(image.path) ;
   });

   // BlocProvider.of<UserBloc>(context as BuildContext).add(UpdatingUserProfileEvent(image: File(image.path))) ;
  }

 // Future<File> saveImagePermenently(String path) async{
 //   final directory =  await getApplication ;
 //   
 //  }
}
