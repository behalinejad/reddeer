

import 'package:flutter/material.dart';

class Project {
  Project({@required this.id,@required this.title,@required this.description,@required this.content,@required this.totalBudget,@required this.currentEarned, this.isActive, this.startDate ,this.dueDate});
  int id,totalBudget,currentEarned,isActive;
  String title,description,content;
  DateTime startDate,dueDate;



  toJson() => {
    'title':title,
    'description':description,
    'content':content,
    'total_budget':totalBudget,
    'current_earned' : currentEarned,
    'is_active' : isActive,
    'due_date' : dueDate,
    'start_date':startDate,
  };



  factory Project.fromJson(Map<String,dynamic> json){
    return Project(
      id: json['id'],
      title : json['title'],
      description : json['description'],
      content : json['content'],
      totalBudget : json['total_budget'],
      currentEarned : json['current_earned'],
      isActive : json['is_active'],
      dueDate : json['due_date'],
      startDate:json['start_date'],

    );
  }

}