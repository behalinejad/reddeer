import 'package:flutter/material.dart';

class BeWithUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('همراه شو ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green[500],
        elevation: 15,

      ),
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
            padding: const EdgeInsets.only(top: 30,left: 16,right: 16,bottom: 10),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Divider(thickness: 4,),
                  SizedBox(height: 8.0,),
                  Text('پویش همیشه به کمک شما دوستدار طبیعت نیاز دارد . لطفا در صورت تمایل به کمک میدانی توانایی های خود را برای شماره تماس 09111169195 ارسال بفرمایید . تا در اسرع وقت با شما تماس حاصل گردد . ',style: TextStyle(fontSize: 16),textDirection: TextDirection.rtl,),
                  SizedBox(height: 8.0,),
                  Divider(thickness: 3,),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
