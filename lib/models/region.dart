
import 'package:flutter/material.dart';

class Region {
  Region({@required this.id, @required this.name});
  int id;
  String name;




  toJson() => {
    'name':name,

  };



  factory Region.fromJson(Map<String,dynamic> json){
    return Region(
      id: json['id'],
      name : json['name'],

    );
  }

}