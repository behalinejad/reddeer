import 'package:flutter/material.dart';

class News {
  News(
      {@required this.id,
      @required this.title,
      @required this.content,
      this.isActive,
      this.publishedDate});

  int id;
  String title, content;
  int isActive;
  DateTime publishedDate;

  toJson() => {
        'title': title,
        'content': content,
        'is_active': isActive,
        'published_date': publishedDate,
      };

  toJsonById() => {
        'id': id,
        'title': title,
        'content': content,
        'is_active': isActive,
        'published_date': publishedDate,
      };
  


  factory News.fromJson(Map<String,dynamic> json){
    return News(
      id : json['id'],
      title : json['title'],
      content : json['content'],
      isActive : json['is_active'],
      publishedDate : json['published_date'],

    );
  }
}
