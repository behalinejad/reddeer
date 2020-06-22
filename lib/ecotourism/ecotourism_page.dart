import 'package:flutter/material.dart';
import 'package:reddeercampaign/ecotourism/houses_in_region.dart';
import 'package:reddeercampaign/ecotourism/region_list_page.dart';
import 'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/products/products_listview.dart';


class EcoTourismPage extends StatefulWidget {


  @override
  _EcoTourismPageState createState() => _EcoTourismPageState();
}

class _EcoTourismPageState extends State<EcoTourismPage> {
  Http http = Http();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('مناطق '),
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
          stream: http.makeRegionGetRequest(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return  RegionListPage(regionList: snapshot.data,);//ProductsListView(productsList: snapshot.data,);// NewsListView(newsList: snapshot.data,);
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
