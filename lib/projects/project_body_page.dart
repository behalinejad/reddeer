import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:reddeercampaign/custom_widgets/Platform_alert_get_project_donation.dart';
import 'package:reddeercampaign/custom_widgets/platform_alert_dialog.dart';
import 'package:reddeercampaign/custom_widgets/platform_widget.dart';
import 'package:reddeercampaign/models/project.dart';
import 'dart:math';

class ProjectBodyPage extends StatelessWidget {
  const ProjectBodyPage({Key key, this.project}) : super(key: key);
  final Project project;


  @override
  Widget build(BuildContext context) {
    final double progressInt = project.currentEarned /project.totalBudget;
     return SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            project.totalBudget>0 ? Text('بودجه محقق شده ' , style: TextStyle(fontWeight: FontWeight.bold)) : SizedBox(height: 10,),
            project.totalBudget>0 ? CircularPercentIndicator(
              radius:150.0 ,
              lineWidth:10.0,
              percent: progressInt,
              center: Text('%'+(progressInt*100).toStringAsFixed(2)),
              progressColor: Colors.greenAccent,

            ): Text(' نحوه همراهی در این پروژه به صورت میدانی می باشد ' , style: TextStyle(fontWeight: FontWeight.bold)) ,
           SizedBox(height: 10,),
           Divider(thickness: 3,),
           SizedBox(height: 10,),
           Text(project.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(project.description,style: TextStyle(fontSize: 16),textDirection: TextDirection.rtl,),
            SizedBox(height: 10,),
            Divider (thickness: 3,),
            Padding(
              padding: const EdgeInsets.only(right: 50,left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  project.totalBudget>0 ? Column(
                    children: <Widget>[
                      Text('  کمک نقدی',style: TextStyle(fontWeight: FontWeight.w600),),
                      MaterialButton(
                        onPressed: () {PlatformAlertGetProjectDonation(
                          title: 'کمک نقدی ',
                          content: 'لطفا مبلغ کمک نقدی خود را وارد نمایید ',
                          defaultActionText: ' انتقال به سایت پرداخت  ',
                          cancelActionText: 'بازگشت ',
                        ).show(context);
                        },
                        color: Colors.green[100],
                        textColor: Colors.greenAccent,
                        child: Icon(
                          Icons.view_headline,
                          size: 30,
                          color: Colors.black12,
                        ),
                        padding: EdgeInsets.all(8),
                        shape: CircleBorder(),
                      ),
                    ],
                  ) : Container(),
                  Column(
                    children: <Widget>[
                      Text(' کمک میدانی ',style: TextStyle(fontWeight: FontWeight.w600),),
                      MaterialButton(
                        onPressed: () {
                          PlatformAlertDialog(
                            title:'تماس با روابط عمومی پویش ',
                            content: 'در صورت تمایل به همکاری با روابط عمومی پویش تماس حاصل فرمایید . 09111169195',
                            defaultActionText: 'OK',
                          ).show(context);
                        },
                        color: Colors.green[100],
                        textColor: Colors.greenAccent,
                        child: Icon(
                          Icons.view_headline,
                          size: 30,
                          color: Colors.black12,
                        ),
                        padding: EdgeInsets.all(8),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),

                ],
              ),
            ),



          ],

        ),
    ),
     );
  }
}
