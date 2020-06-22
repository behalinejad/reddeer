import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddeercampaign/custom_widgets/platform_widget.dart';



class PlatformAlertGetProjectDonation extends PlatformWidget {
  PlatformAlertGetProjectDonation({
    @required this.title,
    @required this.content,
    this.cancelActionText,
    @required this.defaultActionText})
      : assert(title != null),
        assert(content != null),
        assert(content != null);

  final String title;
  final String content;
  final String cancelActionText;
  final String defaultActionText;


  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
      context: context, builder: (context) => this,)
        : await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      // user cannot close the dialoge by clicking outside the dialog
      builder: (
          context) => this, // 'this' is used for object currently is beeing used which is platformalertdialog
    );


  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl,),
      content: Column(
        children: <Widget>[

          Text(content,style: TextStyle(fontSize: 22,),textDirection: TextDirection.rtl,),
          SizedBox(height: 20,),
          TextField(

           // onChanged: (text){ String text },
            keyboardType: TextInputType.number,
            // controller: _signInPasswordController,
            decoration: InputDecoration(
              labelText: ' ریال  ',
              // icon: Icon(Icons.attach_money),
            ),
            // obscureText: true,

          ),
          SizedBox(height: 20,),
        ],
      ),
      actions: _buildAction(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
          title: Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl,),
          content: Column(
            children: <Widget>[

              Text(content,style: TextStyle(fontSize: 22,),textDirection: TextDirection.rtl,),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
               // controller: _signInPasswordController,
                decoration: InputDecoration(
                  labelText: ' ریال  ',
                 // icon: Icon(Icons.attach_money),
                ),
               // obscureText: true,

              ),
              SizedBox(height: 20,),
            ],
          ),
          actions: _buildAction(context)),
    );
  }

  List<Widget> _buildAction(BuildContext context) {

    final actions = <Widget>[];
    if (cancelActionText != null){
      actions.add(
        PlatformAlertDialogAction(
          child: Text(cancelActionText),
          onPressed: () => Navigator.of(context).pop(false),
        ),

      );
    }
    actions.add(
      PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onPressed: () {},
      ),
    );
    return actions;
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  PlatformAlertDialogAction({this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;


  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }

}