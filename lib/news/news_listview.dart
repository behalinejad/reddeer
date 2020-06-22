import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddeercampaign/models/news.dart';
import 'package:reddeercampaign/news/news_content.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key key,@required this.newsList}) : super(key: key);
  final List<News> newsList;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:newsList.length ,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Card(
              color: Colors.green[200],
              elevation: 10,
              child: InkWell(
                splashColor: Colors.black,
                child: ListTile(
                  onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsContent(title:newsList[index].title,content: newsList[index].content )));
                  },

                  title: Text(newsList[index].title,textDirection: TextDirection.rtl),
                  leading: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          );
          }
      );

  }
}
