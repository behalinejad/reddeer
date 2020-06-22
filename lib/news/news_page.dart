import 'package:flutter/material.dart';
import 'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/news/news_listview.dart';

class NewsPage extends StatefulWidget {


  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Http http = Http();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('تازه ها '),
    centerTitle: true,
    backgroundColor: Colors.green[500],
    elevation: 10,
    ),
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.lightBlue,
          gradient: LinearGradient(
            colors: [Colors.grey[200], Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder(
          stream: http.makeIsActiveNewsGetRequest('1'),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return  NewsListView(newsList: snapshot.data,);
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
