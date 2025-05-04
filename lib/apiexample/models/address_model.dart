import 'package:order_delivery/apiexample/core/api/end_points.dart';

class AddressModel {
  String? street;
  String? suite;
  String? city;
  //String? zipcode;
  //Geo? geo;

  AddressModel({this.street, this.suite, this.city});

  AddressModel.fromJson(Map<String, dynamic> json) {
    street = json[ApiKey.street];
    suite = json[ApiKey.suite];
    city = json[ApiKey.city];
    // zipcode = json['zipcode'];
    // geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    // data['zipcode'] = zipcode;
    // if (geo != null) {
    //   data['geo'] = geo!.toJson();
    // }
    return data;
  }
}
//
// class Geo {
//   String? lat;
//   String? lng;
//
//   Geo({this.lat, this.lng});
//
//   Geo.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lat'] = lat;
//     data['lng'] = lng;
//     return data;
//   }
// }
