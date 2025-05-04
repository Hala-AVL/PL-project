import 'dart:io';

import 'package:flutter/material.dart' ;
import 'package:http/http.dart' as http ;

import 'core/constants/strings.dart';
import 'core/errors/errors.dart';
late final http.Client client ;
signup (String username , String email) async{
   try {
   var response = await client.post(Uri.parse(SIGNUP_LINK) , body: {
     "username" :  username ,
     "email" : email
   }) ;

   if (response.statusCode >= 200 && response.statusCode <= 300) {
     return;
   } else if (response.statusCode == 405) {
     throw ServerException(message: "Wrong phone number or password");
   } else {
     throw ServerException(message: "Server Error while Signing up");
   }
} on ServerException catch (se) {
throw NetworkException(
message: "Network Error during signup: ${se.message}");
} catch (e) {
throw NetworkException(message: "Network Error during signup: $e");
}
}