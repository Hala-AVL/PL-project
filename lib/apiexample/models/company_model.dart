import 'package:order_delivery/apiexample/core/api/end_points.dart';

class CompanyModel {
  final String name;
  //String? catchPhrase;
  final String bs;

  CompanyModel({required this.name, required this.bs});

  factory CompanyModel.fromJson(Map<String, dynamic> jsonData) {
   return CompanyModel(
       name: jsonData[ApiKey.name],
       bs: jsonData[ApiKey.bs],
   ) ;
  }

//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//    // data['catchPhrase'] = catchPhrase;
//     data['bs'] = bs;
//     return data;
//   }
}