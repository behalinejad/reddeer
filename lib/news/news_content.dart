import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({Key key,@required this.title,@required this.content}) : super(key: key);
  final String title;
  final String content;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اخبار'),
        centerTitle: true,
        backgroundColor: Colors.green[500],
        elevation: 10,
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(title,style: TextStyle(fontSize: 20),textDirection: TextDirection.rtl,),
                ),
                SizedBox(height: 10,),
                Divider(thickness: 4,),
                SizedBox(height: 10,),
                Card(
                  color: Colors.grey[100],
                  child:Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(content,style: TextStyle(fontSize: 15),textDirection: TextDirection.rtl,),

                    ),
                  ) ,
                ),
                SizedBox(height: 500,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
