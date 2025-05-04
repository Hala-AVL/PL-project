import 'package:flutter/material.dart';
import 'package:order_delivery/apiexample/models/user_model.dart';


class UserWidget extends StatelessWidget{
 final UserModel userModel ;

  const UserWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
     return
       Card(
       color: Colors.grey,
       child: ListTile(
         isThreeLine: true ,
         title: Text(userModel.name),
         subtitle: Text(userModel.email),
         trailing: Text(userModel.company.name),
         leading: Text("${userModel.id}"),
       ),
     ) ;
  }

}