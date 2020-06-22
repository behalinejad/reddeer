


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddeercampaign/be_with_us/be_with_us.dart';
import 'package:reddeercampaign/custom_widgets/custom_raised_button.dart';
import 'package:reddeercampaign/custom_widgets/home_user_container.dart';
import 'package:reddeercampaign/custom_widgets/platform_alert_dialog.dart';
import 'package:reddeercampaign/ecotourism/ecotourism_page.dart';
import 'package:reddeercampaign/logic/bo.dart';
import 'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/models/user.dart';
import 'package:reddeercampaign/news/news_page.dart';
import 'package:reddeercampaign/products/products_page.dart';
import 'package:reddeercampaign/projects/project_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.user,@required this.deviceId}) : super(key: key);
  final User user ;
  final String deviceId;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Http http = Http();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() {
        Navigator.pop(context,'true');},
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: ()  { Platform.isAndroid ?   _confirmExitApp(context) : Navigator.pop(context,'true') ;} ,
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.close),
              onPressed: () => _confirmSignOut(context),
              tooltip: 'Logout',),
          ],
          title: Text('پویش مرال'),
          centerTitle: true,
          backgroundColor: Colors.green[500],
          elevation: 10,

        ),
        //backgroundColor: null,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.lightBlue,
              gradient: LinearGradient(
                colors: [Colors.grey[200], Colors.grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  HomeUserContainer(name:widget.user.name,lastName: widget.user.lastName,),
                  Divider(color: Colors.grey[400], thickness: 5,),
                  CustomRaisedButton(
                    text: 'تازه ها ',
                    imageUrl: 'images/news3.png',
                    onPressed: ()  { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsPage()));},
                  ),
                  Divider(color: Colors.grey[400], thickness: 2,),
                  CustomRaisedButton(
                    text: 'پروژه ها و رویداد ها ',
                    imageUrl: 'images/events.png',
                    onPressed: ()  {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectPage()));
                    },
                  ),
                  Divider(color: Colors.grey[400], thickness: 2,),
                  CustomRaisedButton(
                    text: 'فروش محصولات ',
                    imageUrl: 'images/handmade1.png',
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductsPage()));
                    },
                  ),
                  Divider(color: Colors.grey[400], thickness: 2,),
                  CustomRaisedButton(
                    text: 'اکوتوریسم',
                    imageUrl: 'images/ecotour1.png',
                    onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EcoTourismPage()));
                    },
                  ),
                  Divider(color: Colors.grey[400], thickness: 2,),
                  CustomRaisedButton(
                    text: 'همراه شو  ',
                    imageUrl: 'images/together1.png',
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BeWithUs()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'آیا میخواهید  کابر فعال را تغییر دهید  ',
      cancelActionText: 'خیر ',
      defaultActionText: 'بله ',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(widget.deviceId, http,widget.user);

    }
  }
  Future<void> _confirmExitApp(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'خروج',
      content: 'آیا میخواهیداز برنامه خارج شوید ؟ ',
      cancelActionText: 'خیر ',
      defaultActionText: 'بله ',
    ).show(context);
    if (didRequestSignOut == true) {
      SystemNavigator.pop();
    }
  }

  _signOut(String deviceId, Http http,User user)  {
    try {
      print('USERRRRRRRRR ${user.id}...${user.name}....${user.lastLoginDevice}');
      user.lastLoginDevice='';
      http.makeUserPutRequest(user);
      //print('USERRRRRRRRR ${user.id}...${user.name}....${user.lastLoginDevice}');

      Navigator.pop(context,'true');

    } on Exception catch (e) {
      print(e.toString());
    }
    // user.lastLoginDevice = '';
    //Navigator.of(context).pop(widget.user);
  }
}