

import 'package:flutter/material.dart';

class Product {
  Product({@required this.id,@required this.title,@required this.description,this.amount,this.image, this.price,});
  int id,price,amount;
  String title,description,image;




  toJson() => {
    'title':title,
    'description':description,
    'amount':amount,
    'image':image,
    'price' : price,
    };



  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['id'],
      title : json['title'],
      description : json['description'],
      amount : json['amount'],
      image : json['image'],
      price : json['price'],
    );
  }

}