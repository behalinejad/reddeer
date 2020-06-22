import 'package:flutter/material.dart';
import 'package:reddeercampaign/custom_widgets/avatar.dart';
import 'package:reddeercampaign/models/project.dart';

class ProjectListHeader extends StatelessWidget {
  const ProjectListHeader({Key key, this.projects}) : super(key: key);
  final List<Project> projects;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
        ListView.builder(
        itemCount:projects.length ,
        itemBuilder: (context,index) {
          return Avatar(radius: 8.0,icon: Icons.public,);
        },
    ),

        ],
      ),
    );
  }
}
