import 'package:order_delivery/apiexample/core/api/end_points.dart';
import 'address_model.dart';
import 'company_model.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  UserModel(
      {required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company});


  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      email: jsonData[ApiKey.email],
      phone: jsonData[ApiKey.phone],
      name: jsonData[ApiKey.name],
      address: jsonData[ApiKey.address],
      id: jsonData[ApiKey.id],
      username: jsonData[ApiKey.username],
      website: jsonData[ApiKey.website],
      company: jsonData[ApiKey.company],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['username'] = username;
  //   data['email'] = email;
  //   if (address != null) {
  //     data['address'] = address!.toJson();
  //   }
  //   data['phone'] = phone;
  //   data['website'] = website;
  //   if (company != null) {
  //     data['company'] = company!.toJson();
  //   }
  //   return data;
  // }
}

class Users {
 final List<dynamic> users ;

 Users({required this.users}) ;
 factory Users.fromJson(List<dynamic> usersListJson){
   for(int i = 0 ; i < usersListJson.length ; i++){
     usersListJson[i] = UserModel.fromJson(usersListJson[i]) ;
   }
   return Users(users: usersListJson);
 }
}









