import 'package:flutter/material.dart';
import 'package:reddeercampaign/models/http.dart';
import 'package:reddeercampaign/products/products_listview.dart';


class ProductsPage extends StatefulWidget {


  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  Http http = Http();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('محصولات '),
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
          stream: http.makeProductsGetRequest(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ProductsListView(productsList: snapshot.data,);// NewsListView(newsList: snapshot.data,);
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
