import 'package:flutter/material.dart';
import 'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/projects/projects_list_page.dart';
class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {

    Http http = Http();
    @override
    Widget build(BuildContext context) {
      final  String projectIsActive = '1';
      return Scaffold(
        appBar:  AppBar(
          title: Text('پروژه ها'),
          centerTitle: true,
          backgroundColor: Colors.green[500],
          elevation: 10,
        ),
        body: Container(
          decoration: BoxDecoration(
            //color: Colors.lightBlue,
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[300]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: StreamBuilder(
            stream: http.makeActiveProjectsGetRequest(),
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!=null){
                return  ProjectListPage(projectsList: snapshot.data,);
              }else if(snapshot.hasError){
                return Container(
                  child: Text(snapshot.error.toString()),
                );
              } else{
                return Center(
                  child:CircularProgressIndicator(
                    backgroundColor: Colors.lightBlue,
                    strokeWidth: 5,
                  ),
                );
              }
            },
          ),
        ),
      );
  }
}

