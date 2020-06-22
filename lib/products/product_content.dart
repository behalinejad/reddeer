import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reddeercampaign/models/product.dart';

class ProductsContent extends StatelessWidget {
  const ProductsContent({Key key, this.product}) : super(key: key);
  final Product product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text(product.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                  Column(
                    children: <Widget>[
                      Text('قیمت محصول ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      Text(product.price.toString() +' ریال ',style: TextStyle(fontSize: 16,),),
                    ],
                  ),
                  Divider(thickness: 3,),
                  SizedBox(height: 8.0,),
                   SizedBox(height: 200,
                     child: Image.memory(base64Decode(product.image)),
                   ),
                  Divider(thickness: 3,),
                  Text(product.description,style: TextStyle(fontSize: 16),textDirection: TextDirection.rtl,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
