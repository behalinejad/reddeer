
import 'package:flutter/material.dart';

class HouseImage {
  HouseImage({@required this.id, @required this.image,@required this.houseId});

  int id,houseId;
  String image;


  toJson() => {
    'name':image,
    'house_id':houseId,
  };



  factory HouseImage.fromJson(Map<String,dynamic> json){
    return HouseImage(
      id: json['id'],
      image : json['image'],
      houseId : json['house_id'],
    );
  }

}