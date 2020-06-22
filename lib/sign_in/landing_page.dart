import 'dart:async';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

import 'package:reddeercampaign/home/home_page.dart';
import 'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/sign_in/sign_in_form.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.isSentBack:false}) : super(key: key);
  bool isSentBack ;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final http = Http();
  String myDeviceId;
  //bool isSentBack=false;
  /*@override
  void dispose() {
    super.dispose();
  }*/

  @override
  void initState() {
    super.initState();
    _checkUserAndRoute();
  }


  @override
  Widget build(BuildContext context) {
    if (widget.isSentBack) {
     widget.isSentBack =false;
     _checkUserAndRoute();
    }
    if (myDeviceId == '' || myDeviceId == null) {
      setState(() {});
    }
    // print(myDeviceId);
    return Container(
      decoration: BoxDecoration(
        //color: Colors.lightBlue,
        gradient: LinearGradient(
          colors: [Colors.lightBlueAccent[200], Colors.green],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.lightBlue,
          strokeWidth: 5,
        ),
      ),
    );
  /*  Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.lightBlue,
        strokeWidth: 5,
      ),
    );
    StreamBuilder<User>(
        stream: http.makeUserGetRequestByDeviceId(myDeviceId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                //color: Colors.lightBlue,
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent[200], Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlue,
                  strokeWidth: 5,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          } else if (snapshot.hasData &&
              snapshot.data.lastLoginDevice.length > 1) {
            print(snapshot.data.toJson());
            return MultiProvider(
              providers: [Provider<User>.value(value: snapshot.data)],
              child: HomePage(
                user: snapshot.data,
                deviceId: myDeviceId,
              ),
            );
          } else {
            return MultiProvider(
              providers: [Provider<User>.value(value: snapshot.data)],
              child: SignInForm(
                myDeviceId: myDeviceId,
              ),
            );
          }
        });*/
  }

   Stream<String> getId() async* {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      yield iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print(androidDeviceInfo.androidId.toString());
      yield androidDeviceInfo.androidId; // unique ID on Android

    }
  }

  void _checkUserAndRoute() {
    getId().listen((data){
      if(data != null)
        print(data);
      myDeviceId=data;
      http.makeUserGetRequestByDeviceId(myDeviceId).listen((data) async {
        //print(data.toJson());
        if (data != null) {

          String result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(deviceId: myDeviceId,user: data,)),
          );
          if (result == 'true'){
            widget.isSentBack = true;
          }
        }else{
          String result =await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInForm(myDeviceId: myDeviceId)),
          );
          if (result == 'true'){
            widget.isSentBack = true;
          }
        }
      });

    });

  }
}
