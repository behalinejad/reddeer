

import 'package:flutter/material.dart';

class House {
  House({@required this.id,@required this.regionId,this.description,this.name,this.phoneNumber, this.address,this.mapPoint});
  int id,regionId;
  String name,description,phoneNumber,address,mapPoint;




  toJson() => {
    'name':name,
    'description':description,
    'phone_number':phoneNumber,
    'address':address,
    'map_point' : mapPoint,
    'region_id' : regionId,

  };



  factory House.fromJson(Map<String,dynamic> json){
    return House(
      id: json['id'],
      description : json['description'],
      name : json['name'],
      phoneNumber : json['phone_number'],
      address : json['address'],
      mapPoint : json['map_point'],
      regionId: json['region_id'],
    );
  }

}