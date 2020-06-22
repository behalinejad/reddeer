import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pimp_my_button/pimp_my_button.dart';

import 'package:reddeercampaign/custom_widgets/project_header_avatar.dart';
import 'package:reddeercampaign/models/project.dart';
import 'package:reddeercampaign/projects/project_body_page.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key key, this.projectsList}) : super(key: key);
  final List<Project> projectsList;

  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  Project currentProject;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              //color: Colors.lightBlue,
              border: Border(
                  bottom: BorderSide(width: 2, color: Colors.greenAccent)),
              gradient: LinearGradient(
                colors: [Colors.grey[100], Colors.grey[300]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: CupertinoScrollbar (
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.projectsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 5, bottom: 5, left: 15),
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentProject = widget.projectsList[index];
                                    });
                                  },
                                  color: Colors.yellow[100],
                                  textColor: Colors.white,
                                  child: Icon(
                                    Icons.camera,
                                    size: 40,
                                    color: Colors.black12,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  shape: CircleBorder(),
                                ),
                              ),
                              Text(_makeTitle(widget.projectsList[index].title),style: TextStyle(fontSize: 11),),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ),
          currentProject == null
              ? ProjectBodyPage(project: widget.projectsList[0])
              : ProjectBodyPage(project: currentProject),


          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }



  String _makeTitle(String title) {
    if (title.length > 20) {
      return '...' + title.substring(0, 19);
    } else {
      return title;
    }
  }
}
